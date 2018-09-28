//
//  kStone.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 2/4/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class kStone: SKSpriteNode {
    var stoneChildNumber: Int = 0
    var stoneLife = 8.0
    var mainScene: SKScene?
    var stoneTimer = Timer()
    var stoneTimerOn = false
    var screenHeight: CGFloat!
    var stoneEndLoc: CGFloat = -100
    var timeProgress: Double = 0
    
    func createStone(travelTime: Double) {
        let stone = SKSpriteNode(imageNamed: "stone")
        stone.name = "stone"
        
        let xStoneLoc: CGFloat = CGFloat(arc4random_uniform(UInt32(mainScene!.scene!.size.width)))
        let yStoneLoc: CGFloat = mainScene!.scene!.size.height + 100
        stone.position.x = xStoneLoc
        stone.position.y = yStoneLoc
        
        stone.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: stone.size.width, height: stone.size.height))
        stone.physicsBody?.affectedByGravity = false
        stone.physicsBody?.categoryBitMask = colliderType.stone
        stone.physicsBody?.contactTestBitMask = colliderType.ship
        stone.physicsBody?.collisionBitMask = colliderType.ship
        
        mainScene?.addChild(stone)
        
        // birth settings
        stone.zRotation = CGFloat(arc4random_uniform(UInt32(10)))
        stone.setScale(CGFloat(randomScale()))
        
        // actions: the travel time is an argument in this function
        let stoneAction = SKAction.move(to: CGPoint.init(x: stone.position.x, y: stoneEndLoc), duration: travelTime)
        let stoneRotation = SKAction.rotate(byAngle: CGFloat(randomDub(min: 0, max: 10)), duration: travelTime)
        stone.run(stoneAction)
        stone.run(stoneRotation)
        stoneChildNumber += 1
    }
    
    func randomDub(min: Int, max: Int) -> Int {
        var rotation = min + Int(arc4random_uniform(UInt32(max - min + 1)))
        if rotation % 2 != 0 {
            rotation = -rotation
        }
        return rotation
    }
    
    func randomScale() -> Double {
        let randDouble = drand48()
        var scale = 0.0
        if randDouble < 0.5 {
            scale = 0.5 + randDouble
        } else {
            scale = randDouble
        }
        //print(scale)
        return scale
    }
    
    // this timer function creates the kidney stones
    func stoneTimerFunc() {
        if stoneTimerOn == false {
            stoneTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getMoreDifficult), userInfo: nil, repeats: true)
            //timeProgress += 1
        }
        stoneTimerOn = true
    }
    
    func destroyStones() {
        if mainScene?.childNode(withName: "stone")?.position.y == stoneEndLoc {
            mainScene?.childNode(withName: "stone")?.removeFromParent()
            Labels.instance.reduxScore()
        }
    }
    
    
    
    // stone setups
    func stoneSetups(scene: SKScene) {
        mainScene = scene
        screenHeight = scene.size.height
        print(screenHeight)
    }
    
    func getMoreDifficult() {
        if timeProgress > 50 {
            createStone(travelTime: 3.5)
            createStone(travelTime: 3.0)
            createStone(travelTime: 2.2)
            createStone(travelTime: 1.4)
            //print("Level 6")
        } else if timeProgress > 40 {
            createStone(travelTime: 3.0)
            createStone(travelTime: 4.0)
            createStone(travelTime: 3.5)
            //print("Level 5")
        } else if timeProgress > 30 {
            createStone(travelTime: 4.0)
            createStone(travelTime: 5.0)
            createStone(travelTime: 4.5)
            //print("Level 4")
        } else if timeProgress > 20 {
            createStone(travelTime: 6.0)
            createStone(travelTime: 5.5)
            //print("Level 3")
        } else if timeProgress > 10 {
            createStone(travelTime: 8.0)
            createStone(travelTime: 7.5)
            //print("Level 2")
        } else {
            createStone(travelTime: 10.0)
            createStone(travelTime: 9.0)
            //print("Level 1")
        }

        timeProgress += 1
    }
    
}
