//
//  ParserUtilities.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/13/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "ParserUtilities.h"


@implementation ParserUtilities

+ (UIImage *)getImageFromUrl:(NSString *)url
{
    NSURL *imageUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:imageUrl options:NSDataReadingMappedIfSafe error:nil];
    return [UIImage imageWithData:data];
}
@end
