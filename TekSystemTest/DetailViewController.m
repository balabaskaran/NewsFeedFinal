//
//  DetailViewController.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/7/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "DetailViewController.h"
#import "ParserUtilities.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *newsDetailsTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(ParserDetailModel *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem newsTitle];
        self.newsDetailsTextView.text = [self.detailItem newsDescription];
        self.imageView.image = [UIImage imageNamed:@"news"];
        if ([ParserUtilities getImageFromUrl:[self.detailItem imageUrl]] != nil) {
            [self.imageView setImage:[ParserUtilities getImageFromUrl:[self.detailItem imageUrl]]];
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
