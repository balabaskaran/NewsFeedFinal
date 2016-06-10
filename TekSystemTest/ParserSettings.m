//
//  ParserSettings.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/9/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "ParserSettings.h"
#import "Reachability.h"


 NSString *kIntialSetupKey = @"initialsetup";

@implementation ParserSettings



+ (void)setInitialSetupStatus:(BOOL)status
{
    NSUserDefaults *settingStorage = [NSUserDefaults standardUserDefaults];
    [settingStorage setBool:status forKey:kIntialSetupKey];
    
}
+ (BOOL)isIntialSetupCompleted
{
    NSUserDefaults *settingStorage = [NSUserDefaults standardUserDefaults];
    return [settingStorage boolForKey:kIntialSetupKey];
}

+ (BOOL)networkCheck
{
    
    Reachability *wifiReach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [wifiReach currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:
        {
            NSLog(@"NETWORKCHECK: Not Connected");
            return NO;
            break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"NETWORKCHECK: Connected Via WWAN");
            return NO;
            break;
        }
        case ReachableViaWiFi:
        {
            NSLog(@"NETWORKCHECK: Connected Via WiFi");
            return YES;
            break;
        }
    }
    return false;
    
}
@end
