//
//  HomeViewController.m
//  TekSystemTest
//
//  Created by Balabaskaran on 6/8/16.
//  Copyright (c) 2016 Balabaskaran. All rights reserved.
//

#import "HomeViewController.h"
#import "MasterViewController.h"
#import "AppDelegate.h"
#import "ParserSettings.h"


@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIButton *newsButton;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ParserEntryViewModel *viewModel = [[ParserEntryViewModel alloc] init];
    viewModel.viewModelDelegate = self;
    [viewModel getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (![ParserSettings networkCheck] && ![ParserSettings isIntialSetupCompleted]) {
    
            
            UIAlertController *alerView = [UIAlertController alertControllerWithTitle:@"Top News" message:@"Internet required for intial setup" preferredStyle:UIAlertControllerStyleAlert];
            [alerView addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alerView animated:YES completion:nil];
    } else
    {
        [self gotoNewsPage:[segue destinationViewController]];
    }

}
    

- (void)gotoNewsPage:(UIViewController *)viewcontroller
{
    AppDelegate *delegate = [[AppDelegate alloc] init];
    MasterViewController *controller = (MasterViewController *)viewcontroller;
    controller.managedObjectContext = delegate.managedObjectContext;
}

#pragma ViewModel call back
- (void)didUpdateViewModelToViewController:(ParserEntryViewModel *)viewModel
{
    self.title = viewModel.screenTitle;
    self.headerLabel.text = viewModel.screenHeader;
    [self.newsButton setTitle:viewModel.buttonTitle forState:UIControlStateNormal];
    self.dateLabel.text = viewModel.todayDate;
}


@end
