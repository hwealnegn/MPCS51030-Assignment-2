//
//  ViewController.h
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

// Properties
@property (nonatomic, strong) NSMutableArray *animals;
@property (nonatomic, strong) NSArray *mixedArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, assign) CGFloat previousPage; // used for fade in/out; while I knew I had to compare the previous position/page
                                                    // with the current one to determine direction of the swipe, I was not sure how to
                                                    // store the 'previous' page value; I found this thread helpful:
                                                    // http://stackoverflow.com/questions/2543670/finding-the-direction-of-scrolling-in-a-uiscrollview

// Methods
- (IBAction)buttonTapped:(id)sender;

@end