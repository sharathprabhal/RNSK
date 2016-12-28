//
//  GameView.swift
//  RNSK
//
//  Created by Sharath Prabhal on 12/28/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation
import SpriteKit

@objc(GameView)
class GameView: SKView {
  
  var input: NSNumber?
  var onEnd: RCTBubblingEventBlock?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var bounds: CGRect {
    didSet {
      let scene = GameScene(size: self.frame.size)
      self.presentScene(scene)
    }
  }
}
