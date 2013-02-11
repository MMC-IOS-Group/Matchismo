//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Mark 🚀 on 2/10/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init {
    // Weird initalization for self, very rare to do this
    self = [super init];
    
    // setup a brand new deck of cards
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank  = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}

@end
