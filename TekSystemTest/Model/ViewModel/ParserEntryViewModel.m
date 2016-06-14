//
//  ParserEntryViewModel.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "ParserEntryViewModel.h"
#import "ParserSettings.h"

@implementation ParserEntryViewModel


-(void)getData
{
    ParserEntryViewModel *viewModel = self;
    viewModel.screenTitle = @"News";
    viewModel.screenHeader = @"Top Story - Latest News";
    viewModel.buttonTitle =([ParserSettings networkCheck]) ? @"OnLine News" : @"OffLine News";
    viewModel.todayDate = [self getDate];
    
    [self.viewModelDelegate didUpdateViewModelToViewController:viewModel];
}

- (NSString *)getDate
{
    NSDate *currentDate = [NSDate date];
    return [currentDate description];
}
@end
