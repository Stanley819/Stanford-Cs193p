//
//  Deck.h
//  Matchismo
//
//  Created by 王 丰 on 13-10-20.
//  Copyright (c) 2013年 王 丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard: (Card *)card atTop:(BOOL) atTop;

-(Card *)drawRandomCard;

@end
