//
//  EmergencyViewController.m
//  AcciCare
//
//  Created by Avinash Tag on 09/04/16.
//  Copyright © 2016 Avinash Tag. All rights reserved.
//

#import "EmergencyViewController.h"
#import "ACHealthController.h"
#import "User.h"

@interface EmergencyViewController ()

@end

@implementation EmergencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    User *user = [ACHealthController sharedHealth].user;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
