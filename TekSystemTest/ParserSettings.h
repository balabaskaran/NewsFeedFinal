//
//  ParserSettings.h
//  TekSystemTest
//
//  Created by Balabaskaran on 6/9/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserSettings : NSObject
+ (void)setInitialSetupStatus:(BOOL)status;
+ (BOOL)isIntialSetupCompleted;
+ (BOOL)networkCheck;
@end
