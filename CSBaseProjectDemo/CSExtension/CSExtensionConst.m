//
//  CSExtensionConst.m
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import "CSExtensionConst.h"

/**
 *  成员变量类型（属性类型）
 */
@implementation CSExtensionConst

#pragma mark - 数字类型
NSString *const CSPropertyTypeInt = @"i";
NSString *const CSPropertyTypeShort = @"s";
NSString *const CSPropertyTypeFloat = @"f";
NSString *const CSPropertyTypeDouble = @"d";
NSString *const CSPropertyTypeLong = @"l";
NSString *const CSPropertyTypeLongLong = @"q";
NSString *const CSPropertyTypeChar = @"c";
NSString *const CSPropertyTypeBOOL1 = @"c";
NSString *const CSPropertyTypeBOOL2 = @"b";

NSString *const CSPropertyTypePointer = @"*";

NSString *const CSPropertyTypeIvar = @"^{objc_ivar=}";
NSString *const CSPropertyTypeMethod = @"^{objc_method=}";
NSString *const CSPropertyTypeBlock = @"@?";
NSString *const CSPropertyTypeClass = @"#";
NSString *const CSPropertyTypeSEL = @":";
NSString *const CSPropertyTypeId = @"@";

@end
