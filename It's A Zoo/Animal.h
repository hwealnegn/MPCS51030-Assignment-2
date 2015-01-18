//
//  Animal.h
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject

// Properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *species;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *sound;

@end
