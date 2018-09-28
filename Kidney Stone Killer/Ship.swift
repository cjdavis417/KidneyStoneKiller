//
//  Ship.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 1/29/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class Ship: SKSpriteNode {
    
    var shipPosX: CGFloat = 100
    var mainScene: SKScene?
    //var shipLife = 100
    static let instance = Ship()
    var intHealth = 100
    var timer = Timer()
    var timerOn = false
    
    
    func shipPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = colliderType.ship
        self.physicsBody?.contactTestBitMask = colliderType.stone
        self.physicsBody?.collisionBitMask = colliderType.stone
        
    }
    
    func MovePlayer(moveLeft: Bool) {
        
        if moveLeft {
            self.position.x = self.position.x - 7
            shipPosX = self.position.x
            //print(shipPosX)
        } else {
            self.position.x = self.position.x + 7
            shipPosX = self.position.x
            //print(shipPosX)
        }
        
    }
    
    func regenHealthTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(regenHealth), userInfo: nil, repeats: true)
    }
    
    func regenHealth() {
        if intHealth < 100 {
            intHealth += 1
        }
    }
    

    func shipSetups(scene: SKScene) {
        mainScene = scene
        //screenHeight = scene.size.height
        //print(screenHeight)
    }
    
    
}
