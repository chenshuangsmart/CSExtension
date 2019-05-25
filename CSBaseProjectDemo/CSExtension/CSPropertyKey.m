//
//  CSPropertyKey.m
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import "CSPropertyKey.h"

@implementation CSPropertyKey

- (id)valueInObject:(id)object {
    if ([object isKindOfClass:[NSDictionary class]] && self.type == CSPropertyObjectTypeDictionary) {
        return object[self.name];
    } else if ([object isKindOfClass:[NSArray class]] && self.type == CSPropertyObjectTypeArray) {
        NSArray *array = object;
        NSUInteger index = self.name.intValue;
        if (index < array.count) {
            return array[index];
        }
    }
    return nil;
}

@end
