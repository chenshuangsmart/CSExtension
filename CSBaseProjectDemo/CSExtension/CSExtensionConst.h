//
//  CSExtensionConst.h
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 判断条件

/**
 断言 - 条件为 NO 时返回值
 
 @param condition 条件
 @return 结果
 */
#define CSExtensionAssert2(condation, returnValue)  \
if ((condation) == NO) return returnValue;

#define CSExtensionAssert(condition) CSExtensionAssert2(condition, )

/**
 断言 - 不为空

 @param param 参数
 @param returnValue 返回值
 */
#define CSExtensionAssertParamNotNil2(param, returnValue)   \
CSExtensionAssert2((param) != nil, returnValue)

#define CSExtensionAssertParamNotNil(param) CSExtensionAssertParamNotNil2(param, )

/**
 常量
 */
@interface CSExtensionConst : NSObject

#pragma mark - 数字类型
extern NSString *const CSPropertyTypeInt;
extern NSString *const CSPropertyTypeShort;
extern NSString *const CSPropertyTypeFloat;
extern NSString *const CSPropertyTypeDouble;
extern NSString *const CSPropertyTypeLong;
extern NSString *const CSPropertyTypeLongLong;
extern NSString *const CSPropertyTypeChar;
extern NSString *const CSPropertyTypeBOOL1;
extern NSString *const CSPropertyTypeBOOL2;

extern NSString *const CSPropertyTypePointer;

extern NSString *const CSPropertyTypeIvar;
extern NSString *const CSPropertyTypeMethod;
extern NSString *const CSPropertyTypeBlock;
extern NSString *const CSPropertyTypeClass;
extern NSString *const CSPropertyTypeSEL;
extern NSString *const CSPropertyTypeId;

@end

NS_ASSUME_NONNULL_END
