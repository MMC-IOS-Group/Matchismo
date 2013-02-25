//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Evan Schaffner on 2/8/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index gameMode:(BOOL)twoCardGame;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic) NSString *move;

@end
