# RSSegmentViewController

The comprehensive control that manages **TabView Layout** like android or **Segmented Layout** using different ViewControllers. Its easy to use with mimium setup required. RSSegmentViewController is built upon [MXSegmentedPager] (https://github.com/maxep/MXSegmentedPager).



![Alt text](/Images/display.png?raw=true "Main")


## Features

- Show multiple Segment/Tab layout in iPhone, iPad.
- Design individual ViewControllers as per your need.
- Navigate through tabs using direct tap or swipe.
- Customizable Color, Fonts and views.
- Prevent user moving to next page by overriding default method


## How To Use

### Storyboard Setup

![Alt text](/Images/setup.png?raw=true "Storyboard Setup")

### ViewController

```objective-c
#import "RSSegmentViewController.h"

@interface ViewController : RSSegmentViewController

@end

@implementation HomeViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if(self){
        
        /* Add as many as pages by adding Titles */
        self.sectionTitles = @[@"Page 1", @"Page 2", @"Page 3"];
        
        /* Customize other properties */
        
        self.useTitleAsSegueIndentifier = YES;
        
        self.textAtttibutes = @{NSForegroundColorAttributeName : [UIColor darkGrayColor]};
        self.selectedTextAtttibutes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        
        self.selectionIndicatorColor = [UIColor orangeColor];
        
    }
    return self;
}

#pragma mark- Navigation

/* return NO for specific Page or ViewController */
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /* Get ViewController or page using identifier  */
}


```

## License

RSSegmentViewController is released under the MIT license. See LICENSE for details.
