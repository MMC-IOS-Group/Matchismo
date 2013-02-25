//
//  Deck.h
//  Matchismo
//
//  Created by Evan Schaffner on 2/7/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *) card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
