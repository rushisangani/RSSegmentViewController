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
        
        self.sectionTitles = @[@"Page 1", @"Page 2", @"Page 3"];
        self.useTitleAsSegueIndentifier = YES;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
