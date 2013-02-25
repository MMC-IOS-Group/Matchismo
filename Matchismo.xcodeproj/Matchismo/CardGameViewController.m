//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Evan Schaffner on 2/7/13.
//  Copyright (c) 2013 Evan Schaffner. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *moveLabel;
@property (weak, nonatomic) IBOutlet UISwitch *gameMode;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    _gameMode.onImage = [UIImage imageNamed:@"2card.png"];
    _gameMode.offImage = [UIImage imageNamed:@"3card.png"];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        [cardButton setImage:card.isFaceUp ? nil : [UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.moveLabel.text = self.game.move;
    _gameMode.onImage = [UIImage imageNamed:@"2card.png"];
    _gameMode.offImage = [UIImage imageNamed:@"3card.png"];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender] gameMode: self.gameMode.on];
    self.flipCount++;
    [self updateUI];
}
- (IBAction)dealNewGame:(UIButton *)sender
{
    _game = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (IBAction)gameMode:(UISwitch *)sender
{
    _game = nil;
    self.flipCount = 0;
    [self updateUI];
}
@end
