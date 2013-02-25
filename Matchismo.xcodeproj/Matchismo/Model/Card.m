//
//  Card.m
//  Matchismo
//
//  Created by Evan Schaffner on 2/7/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize contents = _contents;
@synthesize unplayable = _unplayable;

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}
@end
