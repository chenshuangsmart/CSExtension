//
//  CSPropertyKey.h
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CSPropertyObjectType) {
    CSPropertyObjectTypeDictionary = 0,    // object - 字典
    CSPropertyObjectTypeArray  // object - 数组
};

/**
 根据 key 从对象中取值
 */
@interface CSPropertyKey : NSObject
/** key */
@property(nonatomic, copy)NSString *name;
/** object 的类型 可能是数组,也可能是字典 */
@property(nonatomic, assign)CSPropertyObjectType type;

/**
 根据当前的key(name),从object（字典或者数组）中取值
 */
- (id)valueInObject:(id)object;

@end

NS_ASSUME_NONNULL_END
