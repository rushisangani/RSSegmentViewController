// RSSegmentViewController.m
//
// Copyright (c) Rushi Sangani
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#define kSegmentBackGroundColor         [UIColor colorWithRed:(239/255.f) green:(239/255.f) blue:(241/255.f) alpha:1]
#define kSegmentSelectionIndicatorColor [UIColor colorWithRed:(244/255.f) green:(160/255.f) blue:(53/255.f) alpha:1]

#import "RSSegmentViewController.h"

static CGFloat kDefaultFontSize = 16;
static CGFloat kDefaultSegmentHeight = 46;

@interface RSSegmentViewController ()

@end

@implementation RSSegmentViewController

#pragma mark- Life Cycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareForLayout];
}

#pragma mark- Public methods

-(void)updateSectionTitles:(NSMutableArray *)titles {
    
    [titles enumerateObjectsUsingBlock:^(NSString *_Nonnull title, NSUInteger index, BOOL * _Nonnull stop) {
       [_sectionTitles replaceObjectAtIndex:index withObject:title];
    }];
    
    _sectionTitles = titles;
    self.segmentedPager.segmentedControl.sectionTitles = _sectionTitles;
}

-(void)updateTitle:(NSString *)title AtIndex:(NSUInteger)index {
    
    [_sectionTitles replaceObjectAtIndex:index withObject:title];
    [self updateSectionTitles:_sectionTitles];
}

- (void)insertPageAtIndex:(NSUInteger)index withTitle:(NSString *)title {
    
    [_sectionTitles insertObject:title atIndex:index];
    [self reloadData];
}

- (void)removePageAtIndex:(NSUInteger)index {

    [_sectionTitles removeObjectAtIndex:index];
    
    if(index == self.selectedPageIndex){
        [self.segmentedPager.segmentedControl setSelectedSegmentIndex:index-1 animated:YES];
    }
    [self reloadData];
}

- (void)removePageAtIndex:(NSUInteger)index {

    [_sectionTitles removeObjectAtIndex:index];
    [self reloadData];
}

- (void)reloadData {
    [self.segmentedPager reloadData];
}

#pragma mark- Private methods

-(void)prepareForLayout {
    
    // start segment after navigation bar ends
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    // Segmented Control
    
    self.segmentedPager.backgroundColor = [UIColor whiteColor];
    self.segmentedPager.segmentedControl.type = HMSegmentedControlTypeText;
    self.segmentedPager.segmentedControl.backgroundColor = self.segmentControlBackGroundColor;
    self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // text attributes
    
    self.segmentedPager.segmentedControl.sectionTitles = self.sectionTitles;
    
    self.segmentedPager.segmentedControl.titleTextAttributes = self.textAtttibutes;
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = self.selectedTextAtttibutes;
    
    // selection indicator
    
    self.segmentedPager.segmentedControl.selectionIndicatorHeight = 5.0;
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = self.selectionIndicatorColor;
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
}

#pragma mark <MXSegmentedPagerControllerDataSource>

-(CGFloat) heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return kDefaultSegmentHeight;
}

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return self.sectionTitles.count;
}

- (NSString*) segmentedPager:(MXSegmentedPager*)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    return [self.sectionTitles objectAtIndex:index];
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager segueIdentifierForPageAtIndex:(NSInteger)index {
    return [self getSegueIdentifierForPageIndex:index];
}

-(BOOL)segmentedPager:(MXSegmentedPager *)segmentedPager shouldMoveFromPageAtIndex:(NSUInteger)index {
    
    if([self respondsToSelector:@selector(shouldPerformSegueWithIdentifier:sender:)]){
        return [self shouldPerformSegueWithIdentifier:[self getSegueIdentifierForPageIndex:index] sender:self];
    }
    return YES;
}

#pragma mark- Custom methods

-(NSString *)getSegueIdentifierForPageIndex:(NSUInteger)index {
    return (self.useTitleAsSegueIndentifier) ? [self.sectionTitles objectAtIndex:index] : [self.segueIdentifiers objectAtIndex:index];
}

#pragma mark- Setter / Getter

-(NSDictionary *)textAtttibutes {
    
    if(!_textAtttibutes){
        _textAtttibutes = @{NSForegroundColorAttributeName : [UIColor darkGrayColor], NSFontAttributeName: [UIFont systemFontOfSize:kDefaultFontSize weight:UIFontWeightMedium]};
    }
    return _textAtttibutes;
}

-(NSDictionary *)selectedTextAtttibutes {
    
    if(!_selectedTextAtttibutes){
        _selectedTextAtttibutes = @{NSForegroundColorAttributeName : [UIColor darkTextColor], NSFontAttributeName: [UIFont systemFontOfSize:kDefaultFontSize weight:UIFontWeightMedium]};
    }
    return _selectedTextAtttibutes;
}

-(UIColor *)segmentControlBackGroundColor {
    
    if(!_segmentControlBackGroundColor){
        _segmentControlBackGroundColor = kSegmentBackGroundColor;
    }
    return _segmentControlBackGroundColor;
}

-(UIColor *)selectionIndicatorColor {
    
    if(!_selectionIndicatorColor){
        _selectionIndicatorColor = kSegmentSelectionIndicatorColor;
    }
    return _selectionIndicatorColor;
}

- (NSUInteger)selectedPageIndex {
    return self.segmentedPager.pager.indexForSelectedPage;
}

@end
