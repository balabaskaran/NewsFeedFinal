//
//  ParserEntryViewModel.h
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ParserEntryViewModel;

@protocol ParserEntryViewModelDelegate <NSObject>

- (void)didUpdateViewModelToViewController:(ParserEntryViewModel *)viewModel;

@end

@interface ParserEntryViewModel : NSObject

@property (nonatomic, strong) NSString *screenTitle;
@property (nonatomic, strong) NSString *screenHeader;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, strong) NSString *todayDate;

@property (nonatomic, weak) id <ParserEntryViewModelDelegate>viewModelDelegate;



-(void)getData;

@end
