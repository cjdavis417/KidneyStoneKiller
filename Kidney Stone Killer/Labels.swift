//
//  ScoreKeeper.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 2/11/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class Labels: SKSpriteNode {
    static let instance = Labels()
    //private init() {}
    
    var scoreLabel: SKLabelNode?
    var healthLabel: SKLabelNode?
    var mainScene: SKScene?
    var totalScore = 0
    var totalHealth = 100
    
    
    func CreateScore() {
        scoreLabel?.name = "score"
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel?.zPosition = 5
        scoreLabel?.horizontalAlignmentMode = .right
        scoreLabel?.fontColor = UIColor.white
        scoreLabel?.position = CGPoint(x: (mainScene?.size.height)! - 200, y: (mainScene?.size.width)! - 200)
        mainScene?.addChild(scoreLabel!)
        print("score created")
        }
    
    func CreateHealth() {
        scoreLabel?.name = "health"
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel?.zPosition = 5
        scoreLabel?.horizontalAlignmentMode = .left
        scoreLabel?.fontColor = UIColor.white
        scoreLabel?.position = CGPoint(x: (mainScene?.size.height)! - 200, y: (mainScene?.size.width)! - 200)
        mainScene?.addChild(healthLabel!)
        print("health created")
    }
    
    
    func incrementScore() {
        totalScore += 10
        scoreLabel?.text = "\(totalScore)"
    }
    
    func reduxScore() {
        totalScore -= 5
        scoreLabel?.text = "\(totalScore)"
    }
    
    func reduxHealth() {
        Ship.instance.intHealth -= 3 //totalHealth -= 3
        healthLabel?.text = "\(Ship.instance.intHealth)%"
    }
    
    func increaseHealth() {
        if Ship.instance.timerOn == false {
            Ship.instance.regenHealthTimer()
            Ship.instance.timerOn = true
        }
        healthLabel?.text = "\(Ship.instance.intHealth)%"
    }
    
    func startHealthTimer() {
        
    }
    
    
    
//    func updateScore() {
//        scoreLabel?.text = "Score: \(totalScore)"
//    }
    
    func scoreSetups(scene: SKScene) {
        mainScene = scene
    }
    
}
