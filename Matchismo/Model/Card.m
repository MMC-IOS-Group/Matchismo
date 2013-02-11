//
//  Card.m
//  Matchismo
//
//  Created by Mark 🚀 on 2/10/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int)match:(NSArray *)otherCards {
    int score = 0;
    
    // if one of the cards in other cards matches the card the
    // method is being called on the score is equal to 1
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents])
            score = 1;
    }
    
    return score;
}

@end
