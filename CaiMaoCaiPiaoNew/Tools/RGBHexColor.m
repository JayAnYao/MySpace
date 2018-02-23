//
//  RGBHexColor.m
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/22.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "RGBHexColor.h"

@implementation RGBHexColor

+ (UIColor *)colorWithHexString:(NSString*)stringToConvert {
    if([stringToConvert hasPrefix:@"#"])
    {
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if(![scanner scanHexInt:&hexNum])
    {
        return nil;
    }
    return [self colorWithRGBHex:hexNum];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex{
    int r = (hex >>16) &0xFF;
    int g = (hex >>8) &0xFF;
    int b = (hex) &0xFF;
    return [UIColor colorWithRed:r /255.0f
                           green:g /255.0f
                            blue:b /255.0f
                           alpha:1.0f];
}

@end
