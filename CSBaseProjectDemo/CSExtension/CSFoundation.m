//
//  CSFoundation.m
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/24.
//  Copyright © 2019 cs. All rights reserved.
//

#import "CSFoundation.h"
#import <objc/runtime.h>
#import <CoreData/CoreData.h>

@implementation CSFoundation

/** 是否是 Foundation 的 class 类型*/
+ (BOOL)isClassFromFoundation:(Class)c {
    if (c == [NSObject class] || c == [NSManagedObject class]) {
        return YES;
    }
    
    static NSSet *foundationClasses;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 集合中没有 NSObject,因为几乎所有的类型都是继承自 NSObject,具体是不是 NSObject 需要特殊判断
        foundationClasses = [NSSet setWithObjects:
                             [NSURL class],
                             [NSData class],
                             [NSValue class],
                             [NSError class],
                             [NSArray class],
                             [NSDictionary class],
                             [NSString class],
                             [NSAttributedString class],nil];
    });
    
    // 判断 c 是不是属于 foundationClasses 中的一种类型
    __block BOOL result = NO;
    [foundationClasses enumerateObjectsUsingBlock:^(Class foundationClass, BOOL *stop) {
        if ([c isSubclassOfClass:foundationClass]) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

/** 是否遵守 NSObject 协议属性*/
+ (BOOL)isFromNSObjectProtocolProperty:(NSString *)propertyName {
    if (propertyName == nil || propertyName.length == 0) {
        return NO;
    }
    
    static NSSet<NSString *> *objectProtocolPropertyNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int count = 0;
        objc_property_t *propertyList = protocol_copyPropertyList(@protocol(NSObject), &count);
        NSMutableSet *propertyNames = [NSMutableSet setWithCapacity:count];
        for (int i = 0; i < count; i++) {
            objc_property_t property = propertyList[i];
            NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if (propertyName) {
                [propertyNames addObject:propertyName];
            }
        }
        objectProtocolPropertyNames = [propertyNames copy];
        free(propertyList);
    });
    
    return [objectProtocolPropertyNames containsObject:propertyName];
}

@end
