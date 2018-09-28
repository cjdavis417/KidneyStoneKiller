//
//  shipDamage.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 2/15/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class ShipDamage: SKEmitterNode {
    
    func lightDamage(scene: SKScene, position: CGPoint) {
        let sparks = SKEmitterNode(fileNamed: "ShipLightDamage.sks")
        sparks?.name = "sparks"
        sparks?.position = position
        
        // spark actions
        let fade = SKAction.fadeOut(withDuration: 0.25)
        let wait = SKAction.wait(forDuration: 0.25)
        let kill = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fade, wait, kill])
        sparks?.run(sequence)
        
        // add to scene
        scene.addChild(sparks!)

    }
    
    func heavyDamage(scene: SKScene, position: CGPoint) {
        let fire = SKEmitterNode(fileNamed: "HeavyDamage.sks")
        fire?.name = "fire"
        fire?.position = position
        
        // spark actions
        let fade = SKAction.fadeOut(withDuration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let kill = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fade, wait, kill])
        fire?.run(sequence)
        
        // add to scene
        scene.addChild(fire!)
        
    }
    
    
}
