//
//  Card.m
//  Matchismo
//
//  Created by 王 丰 on 13-10-20.
//  Copyright (c) 2013年 王 丰. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
