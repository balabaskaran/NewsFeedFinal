//
//  TekSystemTestTests.m
//  TekSystemTestTests
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BridgingHeader.h"

@interface TekSystemTestTests : XCTestCase
@property (nonatomic, retain) ParserEntryViewModel *viewModel;
@property (nonatomic, retain) ParserDataManager *dataManager;
- (NSString *)getDate;

@end

@implementation TekSystemTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _viewModel = [[ParserEntryViewModel alloc] init];
    _dataManager = [ParserDataManager sharedManager];
    

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _viewModel = nil;
    _dataManager = nil;
    [super tearDown];
}

- (void)testViewModelGetdata
{
    XCTAssertNotNil(_viewModel, @"the ViewModel should not be nil");
    [_viewModel getData];
    
    ParserEntryViewModel *tempViewModel =[self getDummyData];
    XCTAssertNotNil(tempViewModel, @"the updated vm should not be nil");
    XCTAssertEqualObjects(_viewModel.screenTitle, tempViewModel.screenTitle, @"Screen Title should be same");
    XCTAssertEqualObjects(_viewModel.screenHeader, tempViewModel.screenHeader, @"Screen header should be same");
    XCTAssertEqualObjects(_viewModel.buttonTitle, tempViewModel.buttonTitle, @"The button title should be same");
    XCTAssertEqualObjects(_viewModel.todayDate, tempViewModel.todayDate, @"Today date should be same");

}

- (void)testGetDate
{
    NSString *modelDate = [self getDate];
    NSString *todayDate = [[NSDate date] debugDescription];
    
    XCTAssertNotNil(modelDate, @"the ViewModel date should not be nil");
    XCTAssertNotNil(todayDate, @"today date should not be nil");
    XCTAssertEqualObjects(modelDate, todayDate, @"both date should be same");

}

// Parsing testing

- (void)testXMLParsing
{
     XCTAssertNotNil(_dataManager, @"the Parser datamanager should not be nil");
    [_dataManager startNewsParsing];
    XCTAssertNotNil(_dataManager.feeds, @"the Parser feed array should not be nil");

    NSInteger count = [_dataManager.feeds count];
    XCTAssertGreaterThan(count, 0, @"Parser completed with news");
}

#pragma dummy method to prepare data

- (ParserEntryViewModel *)getDummyData
{
    ParserEntryViewModel *vm = [ParserEntryViewModel new];
    vm.screenTitle = @"News";
    vm.screenHeader = @"Top Story - Google News";
    vm.buttonTitle = @"OnLine News";
    vm.todayDate = [[NSDate date] description];
    
    return vm;
}


- (NSString *)getDate
{
    NSDate *currentDate = [NSDate date];
    return [currentDate description];
}

@end
