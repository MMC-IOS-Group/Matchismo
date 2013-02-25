//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Evan Schaffner on 2/8/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index gameMode:(BOOL)twoCardGame
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable)
    {
            if (!card.isFaceUp)
            {
                if (twoCardGame)
                {
                    self.move = [NSString stringWithFormat:@"Flipped up %@", card.contents];
                    for (Card *otherCard in self.cards)
                    {
                        if (otherCard.isFaceUp && !otherCard.isUnplayable)
                        {
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore)
                        {
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore * MATCH_BONUS;
                            self.move = [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                                card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                        }
                        else
                        {
                            otherCard.faceUp = NO;
                            self.score -= MISMATCH_PENALTY;
                            self.move = [NSString stringWithFormat:@"%@ & %@ don't match! 2 point penalty!", card.contents, otherCard.contents];
                        }
                        break;
                    }
                    }
                }
                else
                {
                    self.move = [NSString stringWithFormat:@"Flipped up %@", card.contents];
                    for (Card *secondCard in self.cards)
                    {
                        for (Card *thirdCard in self.cards)
                        {
                            if (secondCard.isFaceUp && !secondCard.isUnplayable && thirdCard.isFaceUp && !thirdCard.isUnplayable && (thirdCard != secondCard))
                            {
                                int matchScore = [card match:@[secondCard]] + [card match:@[thirdCard]] + [secondCard match:
                                                                                                           @[thirdCard]];
                                if (matchScore)
                                {
                                    card.unplayable = YES;
                                    secondCard.unplayable = YES;
                                    thirdCard.unplayable = YES;
                                    self.score += matchScore * MATCH_BONUS;
                                    self.move = [NSString stringWithFormat:@"Matched %@, %@ & %@ for %d points", card.contents, secondCard.contents, thirdCard.contents, matchScore * MATCH_BONUS];
                                }
                                else
                                {
                                    secondCard.faceUp = NO;
                                    thirdCard.faceUp = NO;
                                    self.score -= MISMATCH_PENALTY;
                                    self.move = [NSString stringWithFormat:@"%@, %@, & %@ don't match! 2 point penalty!",
                                                 card.contents, secondCard.contents, thirdCard.contents];
                                }
                                break;
                            }
                        }
                    }
                }
                self.score -= FLIP_COST;
            }
            card.faceUp = !card.isFaceUp;
        }
}

@end
