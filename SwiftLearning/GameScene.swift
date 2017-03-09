//
//  GameScene.swift
//  SwiftLearning
//
//  Created by huynq on 2/26/17.
//  Copyright © 2017 techkidsvn. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let playerNode = SKSpriteNode(imageNamed: "player-1.png")
    //let flyNode = SKSpriteNode(imageNamed: "fly-1-1")
    let SCENE_MARGIN : CGFloat = 20
    
    let flyWidth : CGFloat = 28
    let flySpace : CGFloat = 10
    
    // 1: Load 1 fly
    
    // 2: Loaf 3 flies
    
    // 3: Load fly matrix
    
    // 4: Load sparse matrix
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0, y: 0)
        
        configPhysics()
        addPlayer()
        
        for flyRow in 0..<3 {
            addFlyRow(flyY: size.height - SCENE_MARGIN - CGFloat(flyRow * 30))
        }
    }
    
    func configPhysics() -> Void {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    func addPlayer() -> Void {
        playerNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        playerNode.position = CGPoint(x: self.size.width / 2, y: SCENE_MARGIN)
        
        addChild(playerNode)
    }

    func addFlyRow(flyY: CGFloat) -> Void {
        let flyXMid : CGFloat = size.width / 2
        let flyIndexMid : CGFloat = 3
        
        for flyIndex in 0..<7 {
            let SPACE = flyWidth + flySpace
            let flyX : CGFloat = flyXMid + (CGFloat(flyIndex) - flyIndexMid) * SPACE
            let flyNode = SKSpriteNode(imageNamed: "fly-1-1")
            flyNode.anchorPoint = CGPoint(x: 0.5, y: 1)
            flyNode.position = CGPoint(x: flyX, y: flyY)
            addChild(flyNode)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let firstTouch = touches.first {
            let location = firstTouch.location(in: self)
            print(location)
            playerNode.position = location
        }
    }
    
    var startTime: TimeInterval = -1
    
    override func update(_ currentTime: TimeInterval) {
        if startTime == -1 {
            // First time running
            startTime = currentTime
        }
        
        if currentTime - startTime > 1 {
            shoot()
            startTime = currentTime
        }
    }
    
    
    func shoot() -> Void {
        let bulletNode = SKSpriteNode(imageNamed: "bullet-1.png")
        // anchor + position
        bulletNode.position = CGPoint(x: 100, y: 100)

        bulletNode.physicsBody = SKPhysicsBody(rectangleOf: bulletNode.size)
        bulletNode.physicsBody?.collisionBitMask = 0
        bulletNode.physicsBody?.velocity = CGVector(dx: 0, dy: 200)
        bulletNode.physicsBody?.linearDamping = 0
        bulletNode.physicsBody?.mass = 0
        
        addChild(bulletNode)
    }
}
