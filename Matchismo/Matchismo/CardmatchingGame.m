//
//  CardmatchingGame.m
//  Matchismo
//
//  Created by 王 丰 on 13-11-2.
//  Copyright (c) 2013年 王 丰. All rights reserved.
//

#import "CardmatchingGame.h"

@interface CardmatchingGame()
@property (nonatomic,readwrite) int score;
@property (strong, nonatomic)  NSMutableArray *cards;   // of cards
@end

@implementation CardmatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isFaceUp) {
        if (card && !card.isUnplayable) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        card.unplayable = YES;
                        otherCard.Unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else{
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                }
                
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else{
                self = nil;
            }
        }
    }
    
    return self;
}

@end
