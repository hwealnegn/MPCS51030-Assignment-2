//
//  Animal.m
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import "Animal.h"

@implementation Animal

/*!
 * @brief Returns a string that describes the animal traits
 * @return An NSString with animal description
 */
-(NSString *)description
{
    NSString *descriptionString = [NSString stringWithFormat:@"Animal Object: name=%@, species=%@, age=%@, image=%@", self.name, self.species, self.age, self.image];
    return descriptionString;
}

@end
