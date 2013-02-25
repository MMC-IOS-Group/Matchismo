//
//  Card.h
//  Matchismo
//
//  Created by Evan Schaffner on 2/7/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
