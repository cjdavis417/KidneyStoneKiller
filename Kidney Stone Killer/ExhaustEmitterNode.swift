//
//  ExhaustEmitter.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 1/29/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class ExhaustEmitterNode: SKEmitterNode {//SKSpriteNode {
    
   
    let shipInfo = Ship()
    var mainScene: SKScene?
    var shipPosX: CGFloat = 0.0
    var shipPosY: CGFloat = 0.0
    
    func shipExhaustEmitter() {
        //let shipExhaust = SKEmitterNode(fileNamed: "HeavyDamage.sks")
        self.emissionAngle = CGFloat(M_PI * 1.5)
        self.position.x = shipPosX
        self.position.y = shipPosY
       
    }
    
//    func MovePlayer(moveLeft: Bool) {
//        
//        if moveLeft {
//            self.position.x = self.position.x - 7
//            //shipPosX = self.position.x
//            //print(shipPosX)
//        } else {
//            self.position.x = self.position.x + 7
//            //shipPosX = self.position.x
//            //print(shipPosX)
//        }
//        
//    }
    
    
  
    
    // gets position of ship
//    func exhaustForShipPosition(x: CGFloat, y: CGFloat) {
//        shipPosX = x
//        shipPosY = y + 100
//        
//    }
    
    
    // bullet setups
//    func exhaustSetups(scene: SKScene) {
//        mainScene = scene
//        print("got exhaust setups")
//    }
    
}
