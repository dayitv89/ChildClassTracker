//
//  ViewController+Swizzling.m
//  Payeezy
//
//  Created by gauravds on 8/19/15.
//  Copyright (c) 2015 GDS. All rights reserved.
//

#import "ViewController+Swizzling.h"
#import "AppDelegate.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController(ChildCount)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self superClass:[self class]
           orignalMethod:@selector(init)
               newMethod:@selector(initGDS)];
        
        [self superClass:[self class]
           orignalMethod:@selector(awakeFromNib)
               newMethod:@selector(awakeFromNibGDS)];
    });
}

- (instancetype)initGDS {
    self = [self initGDS]; // calling self @UIViewController
    [self childCal];
    return self;
}

- (void)awakeFromNibGDS {
    [self awakeFromNibGDS]; // calling self @UIViewController
    [self childCal];
}

- (void)dealloc {
    NSLog(@"calling %@", self);
}

- (void)childCal {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (!appDelegate.childSet) {
        appDelegate.childSet = NSMutableSet.new;
    }
    [appDelegate.childSet addObject:self];
    NSLog(@"UIViewController Childs: %@", appDelegate.childSet);
}

@end
