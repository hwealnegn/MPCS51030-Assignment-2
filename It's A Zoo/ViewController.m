//
//  ViewController.m
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "NSArray+Shuffle.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mixedArray = _mixedArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.scrollView setContentSize:CGSizeMake(960, 500)];
}

- (void)viewWillAppear:(BOOL)animated{
    self.animals = [[NSMutableArray alloc] init]; // original array
    
    // Create new dog object
    Animal *dog = [[Animal alloc] init];
    dog.name = @"Terry";
    dog.species = @"Yorkshire Terrier";
    dog.age = @1;
    dog.image = [UIImage imageNamed:@"puppy.jpg"];
    dog.sound = @"dog";
    
    [self.animals addObject:dog];
    NSLog(@"Dog Description:%@", [dog description]);
    
    // Create new cat object
    Animal *cat = [[Animal alloc] init];
    cat.name = @"Cathy";
    cat.species = @"White Tiger";
    cat.age = @2;
    cat.image = [UIImage imageNamed:@"tiger.jpg"];
    cat.sound = @"cat";
    
    [self.animals addObject:cat];
    NSLog(@"Cat Description:%@", [cat description]);
    
    // Create new owl object
    Animal *owl = [[Animal alloc] init];
    owl.name = @"Olivia";
    owl.species = @"Burrowing Owl";
    owl.age = @3;
    owl.image = [UIImage imageNamed:@"owl.jpg"];
    owl.sound = @"owl";
    
    [self.animals addObject:owl];
    NSLog(@"Owl Description:%@", [owl description]);
    
    _mixedArray = [self.animals shuffle]; // shuffle array
    
    for (int i=0; i<3; i++) {
        // Create an image on each page
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60+(i*320),150,200,200)];
        imageView.image = [_mixedArray[i] image];
        [self.scrollView addSubview:imageView];
        
        // Create a button on each page
        UIButton *button;
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        NSInteger index = [self.animals indexOfObject:_mixedArray[i]];
        [button setTag:index]; // set button tag so that it's associated with mixedArray index
        
        [button setFrame:CGRectMake(110+(i*320),400,100,20)];
        NSString *animalName = [_mixedArray[i] name];
        [button setTitle:[NSString stringWithFormat:@"%@",animalName]forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:)forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
    
    [self.label setText:[_mixedArray[0] name]]; // initialize label
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 *@brief Creates alert when button is tapped
 */
-(IBAction)buttonTapped:(id)sender {
    NSInteger tag = [sender tag];
    
    NSString *name = [self.animals[tag] name];
    NSString *species = [self.animals[tag] species];
    NSNumber *age = [self.animals[tag] age];
    NSString *sound = [self.animals[tag] sound];
    
    NSLog(@"%@", [self.animals[tag] description]); // print description to log

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:[NSString stringWithFormat:@"This %@ is %@ years old!", species, age] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    // Add sound
    SystemSoundID SoundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", sound] ofType:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:soundFile], &SoundID);
    
    AudioServicesPlaySystemSound(SoundID);
    NSLog(@"Sound played: %@", soundFile);
    
}

/*
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // Do stuff here: change label and implement fading
    // Use frame geometry to determine which page you're on
    CGFloat pageCount = 0;
    NSInteger pageCountInt = 0;
    NSInteger pageWidth = scrollView.frame.size.width;
    CGFloat pageMove = scrollView.contentOffset.x/pageWidth;
    
    if (pageMove != pageCount || pageCount == 0){
        pageCount = scrollView.contentOffset.x/pageWidth;
        pageCountInt = roundf(pageCount); // float to int
        [self.label setText:[self.mixedArray[pageCountInt] name]]; // set label
    }
}
*/

-(void) scrollViewDidScroll:(UIScrollView *)scrollView { // used this instead of scrollViewDidEndDecelerating for proper fade effect
    CGFloat pageCount = 0;
    NSInteger pageCountInt = 0;
    NSInteger pageWidth = scrollView.frame.size.width;
    CGFloat pageMove = scrollView.contentOffset.x/pageWidth;
    CGFloat position = scrollView.contentOffset.x;
    
    if (pageMove != pageCount || pageCount == 0){
        pageCount = scrollView.contentOffset.x/pageWidth;
        pageCountInt = roundf(pageCount); // float to int
        [self.label setText:[self.mixedArray[pageCountInt] name]]; // set label
    }
    
    // Fade in/out effect
    if ((position < 160*(2*pageCountInt+1)) && (position > 320*pageCountInt)){
        self.label.alpha = 1-(0.00625*(scrollView.contentOffset.x-(320*pageCountInt))); // from 1 to 0
    }
    if ((position > ((320*pageCountInt)-160)) && (position < 320*(pageCountInt))) {
        self.label.alpha = 0.00625*(scrollView.contentOffset.x-(160*(2*pageCountInt-1))); // from 0 to 1
    }
    
}

@end
