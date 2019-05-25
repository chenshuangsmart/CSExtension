//
//  CSPropertyType.h
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 属性类型 - 包装一种类型
 */
@interface CSPropertyType : NSObject

/** 类型标识符 */
@property(nonatomic, copy)NSString *code;

/** 是否为 Id 类型 */
@property(nonatomic, assign, readonly, getter=isIdType)BOOL idType;

/** 是否为基本数字类型: int float 等 */
@property(nonatomic, assign, readonly, getter=isNumberType)BOOL numberType;

/** 是否为 Bool 类型 */
@property(nonatomic, assign, readonly, getter=isBoolType)BOOL boolType;

/** 对象类型(如果为基本数据类型,此值为 nil) */
@property(nonatomic, readonly)Class typeClass;

/** 类型是否来自 Foundation 框架,比如 NSString , NSArray */
@property(nonatomic, assign, readonly, getter=isFromFoundation)BOOL fromFoundation;

/** 类型是否支持 KVC */
@property(nonatomic, assign, getter=isKvcAbled)BOOL kvcAbled;

/** 获得缓存的类型对象 */
+ (instancetype)cachedTypeWithCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
