//
//  NSString+MD5.m
//  360FM_V3
//
//  Created by huogh on 12-11-23.
//  Copyright (c) 2012年 infomedia. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
- (NSString *)md5
{
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

- (NSString*)md5_1320 {
    NSString *str = [self md5];
    if ([str length] != 32) {
        return @"";
    }
    
    int len = 8;
    NSMutableString *sb = [[NSMutableString alloc] init];
    [sb appendFormat:@"%@", [str substringWithRange:NSMakeRange(1*len, len)]]; // 1
    [sb appendFormat:@"%@", [str substringWithRange:NSMakeRange(3*len, len)]]; // 3
    [sb appendFormat:@"%@", [str substringWithRange:NSMakeRange(2*len, len)]]; // 2
    [sb appendFormat:@"%@", [str substringWithRange:NSMakeRange(0*len, len)]]; // 0
    
    return sb;
}
@end
