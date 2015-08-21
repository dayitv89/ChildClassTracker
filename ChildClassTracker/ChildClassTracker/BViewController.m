//
//  BViewController.m
//  Payeezy
//
//  Created by gauravds on 8/19/15.
//  Copyright (c) 2015 GDS. All rights reserved.
//

#import "BViewController.h"

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)check {
    NSLog(@"Inside B");
}
-(IBAction)backbutton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
-(void) dealloc {
    NSLog(@"instance dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
