//
//  StoneExplosion.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 2/13/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

class StoneExplosion: SKEmitterNode {

    func explodeStones(scene: SKScene, position: CGPoint) {
        let cloud = SKEmitterNode(fileNamed: "RockDestroy.sks")
        cloud?.name = "cloud"
        cloud?.position = position
        
        // cloud actions
        let fade = SKAction.fadeOut(withDuration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let kill = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fade, wait, kill])
        cloud?.run(sequence)
        
        // add to scene
        scene.addChild(cloud!)

    }


}
