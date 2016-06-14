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

 NSString *imageUrl =@"http://i2.cdn.turner.com/cnn/dam/assets/160613212541-orlando-memorial-flowers-top-tease.jpg";
NSString *newsTitle = @"Top news";
NSString *newsDescription =@"Latest top news";

@interface TekSystemTestTests : XCTestCase
@property (nonatomic, strong) ParserEntryViewModel *viewModel;
@property (nonatomic, strong) ParserDataManager *dataManager;
@property (nonatomic, strong) ParserDetailModel *detailModel;
- (NSString *)getDate;

@end

@implementation TekSystemTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _viewModel = [[ParserEntryViewModel alloc] init];
    _dataManager = [ParserDataManager sharedManager];
    _detailModel = [[ParserDetailModel alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _viewModel = nil;
    _dataManager = nil;
    _detailModel = nil;
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

- (void)testImageFromData
{
    UIImage *image = [ParserUtilities getImageFromUrl:imageUrl];
    XCTAssertNotNil(image, @"Image sould not be nil");
    
}

- (void)testInitialSetupStatus
{
    BOOL expectedStatus = YES;
    [ParserSettings setInitialSetupStatus:expectedStatus];
    BOOL parserStatus = [ParserSettings isIntialSetupCompleted];
    XCTAssertTrue(parserStatus, @"RSS feed parsed already");
    XCTAssertEqual(expectedStatus, parserStatus, @"should be same");
}

- (void)testDetailModel
{
    _detailModel = [self loadDummyDataForDetails];
    XCTAssertNotNil(_detailModel.newsTitle);
    XCTAssertNotNil(_detailModel.newsDescription);
    XCTAssertNotNil(_detailModel.imageUrl);
    XCTAssertEqualObjects(_detailModel.newsTitle,newsTitle);
    XCTAssertEqualObjects(_detailModel.newsDescription,newsDescription);
    XCTAssertEqualObjects(_detailModel.imageUrl,imageUrl);


}

#pragma dummy method to prepare data

- (ParserEntryViewModel *)getDummyData
{
    ParserEntryViewModel *vm = [ParserEntryViewModel new];
    vm.screenTitle = @"News";
    vm.screenHeader = @"Top Story - Latest News";
    vm.buttonTitle = @"OnLine News";
    vm.todayDate = [[NSDate date] description];
    
    return vm;
}


- (NSString *)getDate
{
    NSDate *currentDate = [NSDate date];
    return [currentDate description];
}

- (ParserDetailModel *)loadDummyDataForDetails
{
    ParserDetailModel *tempModel =[[ParserDetailModel alloc] init];
    tempModel.newsTitle = newsTitle;
    tempModel.newsDescription = newsDescription;
    tempModel.imageUrl = imageUrl;
    
    return tempModel;
}

@end
