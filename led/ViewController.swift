//
//  ViewController.swift
//  led
//
//  Created by ios on 10/17/16.
//  Copyright © 2016 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var lastOnLed = -1
    var doichieu : Bool = true
    func runningLed()
    {
         if (lastOnLed != -1)
        {
            turnOffLed()
        }
        if (lastOnLed != n && doichieu)
        {
            lastOnLed = lastOnLed + 1
            if lastOnLed == n - 1
            {
                doichieu = false
            }
            print(lastOnLed)
        }
        else if (lastOnLed != 0 && !doichieu)
        {
            lastOnLed = lastOnLed - 1
            if lastOnLed == n - 1
            {
                doichieu = false
            }
            print(lastOnLed)
        }
            
        else
        {
            
            doichieu = true
            
        }
        turnOnLed()
    }
    
        func turnOnLed()
        {
            if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView
            {
                ball.image = UIImage(named: "green")
            }
        }
        func turnOffLed()
        {
            if let ball = self.view.viewWithTag(100 + lastOnLed)
                as? UIImageView
            {
                ball.image = UIImage(named: "grey")
            }
        }
    var n = 6
    var _margin: CGFloat = 60
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ledLeftToRight()
        let timer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector:#selector(runningLed), userInfo: nil, repeats: true)
    }

    func ledLeftToRight()
    {
        for indexHang in 0..<n {
            
            for indexCot in 0..<n {
                print(index)
                let image = UIImage(named: "green")
                let ball =  UIImageView(image: image)
                ball.center = CGPoint(x: _margin + CGFloat(indexHang) * spaceBetweenBall(), y: CGFloat(indexCot)*sizeheight() + _margin)
                
                ball.tag = indexCot + 100
                self.view.addSubview(ball)
            }
        }
    }

  
        func spaceBetweenBall() -> CGFloat {
            let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
            return space
    }
            func sizeheight() -> CGFloat {
            let space = (self.view.bounds.size.height - 2*_margin)/CGFloat(n-1)
                return space
            }
}

