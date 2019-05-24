//
//  CSFoundation.h
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/24.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSFoundation : NSObject

/** 是否是 Foundation 的 class 类型*/
+ (BOOL)isClassFromFoundation:(Class)c;

/** 是否遵守 NSObject 协议属性*/
+ (BOOL)isFromNSObjectProtocolProperty:(NSString *)propertyName;

@end

NS_ASSUME_NONNULL_END
