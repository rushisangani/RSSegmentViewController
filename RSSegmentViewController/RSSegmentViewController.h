// RSSegmentViewController.h
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

#import <UIKit/UIKit.h>
#import "MXSegmentedPagerController.h"

@interface RSSegmentViewController : MXSegmentedPagerController

@property (nonatomic, strong) NSMutableArray *sectionTitles;            // section titles array

@property (nonatomic, strong) NSMutableArray *segueIdentifiers;         // segue identifiers array

@property (nonatomic, assign) BOOL useTitleAsSegueIndentifier;          // set TRUE if you want to use title as segue identifier for the ViewController

@property (nonatomic, strong) NSDictionary *textAtttibutes;             // textAttributes

@property (nonatomic, strong) NSDictionary *selectedTextAtttibutes;     // textAttributes for selected tab

@property (nonatomic, strong) UIColor *segmentControlBackGroundColor;   // back ground color for segment

@property (nonatomic, strong) UIColor *selectionIndicatorColor;         // color to be shown for selected tab

/* public methods */

-(void)updateTitle:(NSString *)title AtIndex:(NSUInteger)index;

-(void)updateSectionTitles:(NSMutableArray *)titles;

-(void)removePageAtIndex:(NSUInteger)index;

-(void)reloadData;

@end
