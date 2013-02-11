//
//  Deck.m
//  Matchismo
//
//  Created by Mark 🚀 on 2/10/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

// Lazy instantiation of cards
-(NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    
    // If we are at the top we want to
    // add a card at the beginning
    if (atTop)
        [self.cards insertObject:card atIndex:0];
    else
        [self.cards addObject:card];
}

- (Card *)drawRandomCard {
    
    Card *randomCard = nil;
    
    // Draws a random card out of the deck
    if (self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
    
}

@end
