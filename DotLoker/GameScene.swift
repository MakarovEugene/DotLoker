//
//  GameScene.swift
//  DotLoker
//
//  Created by Mac on 09.05.16.
//  Copyright (c) 2016 Eug_Rus. All rights reserved.
//

import SpriteKit
import Darwin
class GameScene: SKScene {
    var Dot=SKSpriteNode()
    /*let Xlabel=SKLabelNode()
    let YLabel=SKLabelNode()*/
    var dotDied:Bool=true
    var dotArray=[SKSpriteNode] ()
    var serealCount: Int=0
    /*var serialDot:Bool=false*/
    
    
    override func didMoveToView(view: SKView) //Первональная загрузка игровой сцены
    {
        self.backgroundColor=UIColor.blackColor()
        if dotArray.isEmpty==true
        {
            dotSerial(3)
            /*AddDot()*/
            dotDied=false
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) //Обработка нажатия кнопки
    {
        for touch in touches
        {
            let touchPoint=touch.locationInNode(self)
            if dotArray.isEmpty==false
            {
                for index in 0...dotArray.count-1
                {
                    if dotArray[index].containsPoint(touchPoint)
                    {
                        dotArray[index].removeFromParent()
                        dotArray.removeAtIndex(index)
                        break
                    }
                    else
                    {
                        continue
                    }
                }
            }
            else
            {
                dotDied=true
                print ("The status of Array Empty is \(dotArray.isEmpty)")
            }
        }
    }
    
    func dotSerial (serialCount:Int)//Функция создания нескольких точек
    {
            if dotArray.isEmpty==true
            {
                for _ in 1...serialCount
                {
                    AddDot()
                    dotArray.append(Dot)
                    dotDied=false
                }
            }
        
    }
    func AddDot() //Функция генерации точки в рандомном месте с ограничением по Y=maxY-100
    {
        
        let randX=CGFloat(arc4random_uniform(UInt32(CGRectGetMaxX(self.frame))))
        let randY=CGFloat(arc4random_uniform(UInt32(CGRectGetMaxY(self.frame)-100)))
        Dot=SKSpriteNode(imageNamed: "Dot")
        Dot.position=CGPoint(x: randX, y: randY)
        Dot.size=CGSize(width: 45, height: 45)
        self.addChild(Dot)
        /*Xlabel.text=String(randX)
        YLabel.text=String(randY)
        Xlabel.fontColor=UIColor.blackColor()
        YLabel.fontColor=UIColor.blackColor()
        Xlabel.fontSize=60
        YLabel.fontSize=60
        Xlabel.position=CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        YLabel.position=CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)-Xlabel.fontSize-10)
        addChild(Xlabel)
        addChild(YLabel)*/
 
 
    }
    override func update(currentTime: CFTimeInterval) //Функция обновления точки на экране
    {
        /* Called before each frame is rendered */
        if dotArray.isEmpty==true
        {
         if dotDied==true
         {
            dotSerial(3)
            dotDied=false
         }
        }
    }
}
