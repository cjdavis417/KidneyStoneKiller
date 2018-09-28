//
//  Bullet.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 1/29/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class Bullet: SKEmitterNode {

    var bulletChildNumber: Int = 0
    var bulletTimerOn = false
    var bulletTimer = Timer()
    var mainScene: SKScene?
    var shipPosX: CGFloat = 0.0
    var shipPosY: CGFloat = 0.0
    public let bulletFinalPos: CGFloat = 1200
    var screenHeight: CGFloat?
    
    func createBullets() {
        let bullet = SKEmitterNode(fileNamed: "torpedo.sks") //SKSpriteNode(imageNamed: "bullet")
        bullet?.name = "bullet"
        
        // start position
        bullet?.position.x = shipPosX
        bullet?.position.y = shipPosY
        
        // bullet physics
        bullet?.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        bullet?.physicsBody?.affectedByGravity = false
        bullet?.physicsBody?.categoryBitMask = colliderType.bullet
        bullet?.physicsBody?.contactTestBitMask = colliderType.stone
        bullet?.physicsBody?.collisionBitMask = colliderType.stone
        
        mainScene?.addChild((bullet)!)
        
        // this action is how long it takes the bullet to move across screen
        let bulletAction = SKAction.move(to: CGPoint.init(x: (bullet?.position.x)!, y: screenHeight!) , duration: 2)
        bullet?.run(bulletAction)
        bulletChildNumber += 1
    }
    
    // timer func for bullet firing
    func bulletTimerFunc() {
        if bulletTimerOn == false {
            bulletTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(createBullets), userInfo: nil, repeats: true)
        }
            bulletTimerOn = true
    }
    
    // gets position of ship
    func bulletForShipPosition(x: CGFloat, y: CGFloat) {
        shipPosX = x
        shipPosY = y + 50
        
        
    }
    
    func destroyBullets() {
            if mainScene?.childNode(withName: "bullet")?.position.y == screenHeight {
                mainScene?.childNode(withName: "bullet")?.removeFromParent()
            }
    }
    
    // bullet setups
    func bulletSetups(scene: SKScene) {
        mainScene = scene
        screenHeight = scene.size.height
    }
    
}
