//
//  DetailViewController.h
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserDetailModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ParserDetailModel *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

