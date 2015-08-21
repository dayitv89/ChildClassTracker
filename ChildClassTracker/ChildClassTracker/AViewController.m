//
//  ViewController.m
//  Payeezy
//
//  Created by gauravds on 8/19/15.
//  Copyright (c) 2015 GDS. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "AppDelegate.h"

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //-- Just for test added some objects instead of create their VC in storyboard
    BViewController *bvc1 = BViewController.new;
    bvc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    bvc1 = [BViewController new];
    BViewController *bvc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    CViewController *cvc = [CViewController new];
    
    NSMutableSet *childSet = [(AppDelegate*)[[UIApplication sharedApplication] delegate] childSet];
    self.txtView.text = [NSString stringWithFormat:@"%@", childSet];

    //--object is still persistent in the memory so please use memory optimization here.
    for (id a in childSet) {
        if ([a isMemberOfClass:[BViewController class]]) {
            [(BViewController*)a check];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
