//
//  HomeViewController.m
//  RSSegmentViewControllerExample
//
//  Created by Rushi Sangani on 12/06/16.
//  Copyright © 2016 Rushi Sangani. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if(self){
        
        self.sectionTitles = [@[@"Page 1", @"Page 2", @"Page 3"] mutableCopy];
        
        self.useTitleAsSegueIndentifier = YES;
        
        self.textAtttibutes = @{NSForegroundColorAttributeName : [UIColor darkGrayColor]};
        self.selectedTextAtttibutes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        
        self.selectionIndicatorColor = [UIColor orangeColor];
        self.segmentControlBackGroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark- Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
