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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.animals = [[NSMutableArray alloc] init];
    //[self.animals shuffle]; // shuffle array (not working??)
    [self.scrollView setContentSize:CGSizeMake(960, 500)];
    
    //NSLog(@"Shuffled animals: %@", [self.animals shuffle]);
}

- (void)viewWillAppear:(BOOL)animated{
    self.animals = [[NSMutableArray alloc] init];
    
    // Create new dog object
    Animal *dog = [[Animal alloc] init];
    dog.name = @"Terry";
    dog.species = @"Yorkshire Terrier";
    dog.age = @1;
    dog.image = [UIImage imageNamed:@"puppy.jpg"];
    
    [self.animals addObject:dog];
    NSLog(@"Dog Description:%@", [dog description]);
    
    // Create new cat object
    Animal *cat = [[Animal alloc] init];
    cat.name = @"Cathy";
    cat.species = @"White Tiger";
    cat.age = @2;
    cat.image = [UIImage imageNamed:@"tiger.jpg"];
    
    [self.animals addObject:cat];
    NSLog(@"Cat Description:%@", [cat description]);
    
    // Create new owl object
    Animal *owl = [[Animal alloc] init];
    owl.name = @"Olivia";
    owl.species = @"Burrowing Owl";
    owl.age = @3;
    owl.image = [UIImage imageNamed:@"owl.jpg"];
    
    [self.animals addObject:owl];
    NSLog(@"Owl Description:%@", [owl description]);
    
    self.mixedArray = [self.animals shuffle]; // shuffle array
    
    for (int i=0; i<3; i++) {
        // Create an image on each page
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60+(i*320),150,200,200)];
        //imageView.image = [self.animals[i] image];
        imageView.image = [self.mixedArray[i] image];
        [self.scrollView addSubview:imageView];
        
        // Create a button on each page
        UIButton *button;
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTag:i];
        [button setFrame:CGRectMake(110+(i*320),400,100,20)];
        //NSString *animalName = [self.animals[i] name];
        NSString *animalName = [self.mixedArray[i] name];
        [button setTitle:[NSString stringWithFormat:@"%@",animalName]forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped:)forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 *@brief Receives touches from buttons
 */
-(IBAction)buttonTapped:(id)sender {
    NSInteger tag = [sender tag];
    NSString *name = [self.animals[tag] name];
    //NSString *name = [self.mixedArray[tag] name]; // doesn't work (does not show up?)
    NSString *species = [self.animals[tag] species];
    NSNumber *age = [self.animals[tag] age];
    //NSLog(@"Age: %@, Species: %@", age, species);
    NSLog(@"%@", [self.animals[tag] description]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:[NSString stringWithFormat:@"This %@ is %@ years old!", species, age] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // Do stuff here (implement fading here?)
    //[self.label setText:[self.animals[i] name]]; // incorrect
    
}

@end
