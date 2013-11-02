//
//  CardmatchingGame.h
//  Matchismo
//
//  Created by 王 丰 on 13-11-2.
//  Copyright (c) 2013年 王 丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardmatchingGame : NSObject

//designated intializier
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
