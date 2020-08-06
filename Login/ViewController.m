//
//  ViewController.m
//  Login
//
//  Created by Raja Adeel Ahmed on 7/10/20.
//  Copyright © 2020 Raja Adeel Ahmed. All rights reserved.
//

#import "ViewController.h"
#import "DashboardViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblNamePass;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnNextPressed:(id)sender {
    
    
    
    
        NSString * str = @"ACLKSJLDKJ";
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"IsLogin"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        DashboardViewController *vc = [[DashboardViewController alloc] init];
        [vc loadView];
        // [self.navigationController pushViewController:vc animated:FALSE];
        
        UIApplication.sharedApplication.windows.firstObject.rootViewController = vc;
        [self.navigationController popToRootViewControllerAnimated:true];
    
}

@end
