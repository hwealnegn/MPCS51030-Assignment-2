//
//  ViewController.h
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

{
    AVAudioPlayer *_soundEffect;
}

// Properties
@property (nonatomic, strong) NSMutableArray *animals;
@property (nonatomic, strong) NSArray *mixedArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *label;

// Methods
- (IBAction)buttonTapped:(id)sender;

@end