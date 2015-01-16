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
    self.animals = [[NSMutableArray alloc] init];
    [self.scrollView setContentSize:CGSizeMake(960, 500)];
}

- (void)viewWillAppear:(BOOL)animated{
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
    cat.name = @"Tigger";
    cat.species = @"White Tiger";
    cat.age = @2;
    cat.image = [UIImage imageNamed:@"tiger.jpg"];
    
    [self.animals addObject:cat];
    NSLog(@"Cat Description:%@", [cat description]);
    
    // Create new pig object
    Animal *owl = [[Animal alloc] init];
    owl.name = @"Hoot";
    owl.species = @"Owl";
    owl.age = @3;
    owl.image = [UIImage imageNamed:@"owl.jpg"];
    
    [self.animals addObject:owl];
    NSLog(@"Owl Description:%@", [owl description]);
    
    // Display shuffled animals array
    NSLog(@"Shuffled animals: %@", [self.animals shuffle]);
    
    for (int i=0; i<3; i++) {
        // Create an image on each page
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(70+(i*320),150,200,200)];
        imageView.image = [self.animals[i] image];
        [self.scrollView addSubview:imageView];
        
        // Create a button on each page
        UIButton *button;
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTag:i];
        [button setFrame:CGRectMake(110+(i*320),400,100,20)]; // not centered on screen when x=160?
        NSString *animalName = [self.animals[i] name];
        [button setTitle:[NSString stringWithFormat:@"%@",animalName]forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
