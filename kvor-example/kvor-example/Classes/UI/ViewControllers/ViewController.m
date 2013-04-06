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
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*4);
    
    __block typeof(self) weakSelf = self;
    [KVOR target:self.scrollView
         keyPath:@"contentOffset"
            task:^(NSString *keyPath, NSDictionary *change) {
                if ([keyPath isEqualToString:@"contentOffset"]) {
                    NSLog(@"Offset: %@", NSStringFromCGPoint([weakSelf.scrollView contentOffset]));
                }
                
            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
