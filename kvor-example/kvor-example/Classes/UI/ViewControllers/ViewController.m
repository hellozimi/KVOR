//
//  ViewController.m
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import "ViewController.h"
#import "KVOR.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.slider.continuous = YES;
    
    __block typeof(self) weakSelf = self;
    
    [KVOR target:self.slider
         keyPath:@"value"
            task:^(NSString *keyPath, NSDictionary *change) {
                if ([keyPath isEqualToString:@"value"]) {
                    NSLog(@"VALUE: %f", [weakSelf.slider value]);
                }
                
            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
