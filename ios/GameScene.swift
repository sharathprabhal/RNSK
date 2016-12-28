//
//  GameScene.swift
//  RNSK
//
//  Created by Sharath Prabhal on 12/28/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
  override func didMove(to view: SKView) {
    //setup a background color
    self.backgroundColor = SKColor.lightGray
    
    var text = "GameScene"
    if let parent = self.view as? GameView {
      text = parent.input!.stringValue
    }
    
    let label = SKLabelNode(text: text)
    label.fontColor = SKColor.white
    label.fontSize = 48
    label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
    addChild(label)
    
    // return a random value after 1 seconds
    let wait = SKAction.wait(forDuration: 1)
    let end = SKAction.run {
      let r = arc4random_uniform(10)
      if let parent = self.view as? GameView {
        parent.onEnd!(["score": r])
      }
    }
    run(SKAction.sequence([wait, end]))
  }
}
