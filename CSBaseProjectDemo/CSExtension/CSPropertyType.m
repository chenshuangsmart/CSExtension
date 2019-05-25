//
//  CSPropertyType.m
//  CSBaseProjectDemo
//
//  Created by cs on 2019/5/25.
//  Copyright © 2019 cs. All rights reserved.
//

#import "CSPropertyType.h"

@implementation CSPropertyType

+ (instancetype)cachedTypeWithCode:(NSString *)code {
    CSExtensionAssertParamNotNil2(code, nil);
    
    static NSMutableDictionary *types;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        types = [NSMutableDictionary dictionary];
    });
    
    CSPropertyType *type = types[code];
    if (types == nil) {
        type = [[self alloc] init];
        type.code = code;
        types[code] = type;
    }
    return type;
}

#pragma mark - 公共方法

- (void)setCode:(NSString *)code {
    _code = code;
    
    CSExtensionAssertParamNotNil(code);
    
    if ([code isEqualToString:CSPropertyTypeId]) {
        _idType = YES;
    } else if (code.length == 0) {
        _kvcAbled = NO;
    } else if (code.length > 3 && [code hasPrefix:@"@\""]) {
        // 去掉 @" 和 ", 截取中间的类型名称
        _code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _fromFoundation = [CSFoundation isClassFromFoundation:_typeClass];
        _numberType = [_typeClass isSubclassOfClass:[NSNumber class]];
    } else if ([code isEqualToString:CSPropertyTypeSEL] || [code isEqualToString:CSPropertyTypeIvar] || [code isEqualToString:CSPropertyTypeMethod]) {
        _kvcAbled = NO;
    }
    
    // 是否为数字类型
    NSString *lowerCode = _code.lowercaseString;
    NSArray *numberTypes = @[CSPropertyTypeInt,
                             CSPropertyTypeShort,
                             CSPropertyTypeFloat,
                             CSPropertyTypeDouble,
                             CSPropertyTypeLong,
                             CSPropertyTypeLongLong,
                             CSPropertyTypeChar,
                             CSPropertyTypeBOOL1,
                             CSPropertyTypeBOOL2];
    
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
        
        if ([lowerCode isEqualToString:CSPropertyTypeBOOL1] || [lowerCode isEqualToString:CSPropertyTypeBOOL2]) {
            _boolType = YES;
        }
    }
}

@end
