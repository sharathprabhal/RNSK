//
//  RCTGameManager.m
//  RNSK
//
//  Created by Sharath Prabhal on 12/28/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RNSK-Swift.h"
#import "RCTViewManager.h"

@interface RCTGameManager : RCTViewManager
@end

@implementation RCTGameManager

RCT_EXPORT_VIEW_PROPERTY(onEnd, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(input, NSNumber)

RCT_EXPORT_MODULE()

GameView *view;

- (UIView *)view
{
  view = [[GameView new] init];
  return view;
}

@end
