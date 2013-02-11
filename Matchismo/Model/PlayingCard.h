//
//  PlayingCard.h
//  Matchismo
//
//  Created by Mark 🚀 on 2/10/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger)maxRank;

@end
