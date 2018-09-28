//
//  KSKMainGame.swift
//  Kidney Stone Killer
//
//  Created by Christopher Davis on 1/29/17.
//  Copyright © 2017 Monkey Face LLC. All rights reserved.
//

import SpriteKit

struct colliderType {
    static let ship: UInt32 = 0
    static let bullet: UInt32 = 1
    static let stone: UInt32 = 2
}

class KSKMainGame: SKScene, SKPhysicsContactDelegate {
    
    var ship: Ship?
    var xCenter: CGFloat?
    var yCenter: CGFloat?
    var canMove = false
    var moveLeft = false
    private let bulletClass = Bullet()
    private let kStoneClass = kStone()
    let shipClass = Ship()
    let labels = Labels()
    var exhaust: ExhaustEmitterNode?
    let explosion = StoneExplosion()
    let damage = ShipDamage()
    var healthTimer = Timer()
    
    
    override func didMove(to view: SKView) {
        initializeWorld()
    }
    
    private func initializeWorld() {
        
        physicsWorld.contactDelegate = self
        
        xCenter = (self.scene?.size.width)! / 2
        yCenter = (self.scene?.size.height)! / 2
        ship = self.childNode(withName: "Ship") as! Ship?
        ship?.shipPhysics()
        bulletClass.bulletSetups(scene: self)
        kStoneClass.stoneSetups(scene: self)
        labels.scoreSetups(scene: self)
        labels.CreateScore()
        getLabels()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        ManageShip()
        ManageBullets()
        ManageStones()
        ManageLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if location.x > xCenter! {
                moveLeft = false
            } else {
                moveLeft = true
            }
        }
        canMove = true
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        
        if contact.bodyA.node?.name == "bullet" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else if contact.bodyA.node?.name == "ship" || contact.bodyB.node?.name == "ship" {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if contact.bodyA.categoryBitMask == colliderType.bullet || contact.bodyB.categoryBitMask == colliderType.bullet {
            explosion.explodeStones(scene: self, position: (secondBody.node?.position)!)
            firstBody.node?.removeFromParent()
            secondBody.node?.removeFromParent()
            Labels.instance.incrementScore()
        }
       
        if contact.bodyA.categoryBitMask == colliderType.ship || contact.bodyB.categoryBitMask == colliderType.ship {
            if Ship.instance.intHealth > 25 {
                print("ship got hit")
                Labels.instance.reduxHealth()
                damage.lightDamage(scene: self, position: (ship?.position)!)
            } else {
                Labels.instance.reduxHealth()
                damage.heavyDamage(scene: self, position: (ship?.position)!)
            }
        }
        
    }
    
    func ManageShip() {
        if canMove {
            ship?.MovePlayer(moveLeft: moveLeft)
        }
    }

    func ManageBullets() {
        bulletClass.bulletTimerFunc()
        bulletClass.bulletForShipPosition(x:(ship?.shipPosX)!, y: (ship?.position.y)!)
        bulletClass.destroyBullets()
        
    }
    
    func ManageStones() {
        kStoneClass.stoneTimerFunc()
        kStoneClass.destroyStones()
    }
    
    func getLabels() {
        Labels.instance.scoreLabel = self.childNode(withName: "score") as! SKLabelNode?
        Labels.instance.healthLabel = self.childNode(withName: "health") as! SKLabelNode?
    }
    
    func ManageLabels() {
        Labels.instance.increaseHealth()
    }
    


}
