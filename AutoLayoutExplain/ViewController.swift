//
//  ViewController.swift
//  AutoLayoutExplain
//
//  Created by あらさん on 2021/02/17.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet var v1C: NSLayoutConstraint!
    @IBOutlet var v2C: NSLayoutConstraint!
    @IBOutlet var v3C: NSLayoutConstraint!
   
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.layoutIfNeeded()
        
        v1C.priority = .init(400)
        v2C.priority = .init(400)
        v3C.priority = .init(400)
        
        let touchevent = touches.first!
        let prevLocation = touchevent.previousLocation(in: self.view)
        let newLocation = touchevent.location(in: self.view)
        let div_x = newLocation.x - prevLocation.x
        let div_y = newLocation.y - prevLocation.y
        
        if div_x*div_x > div_y*div_y {
            v2C.priority = .init(900)
        } else {
            if div_y >= 0 {
                v3C.priority = .init(900)
            } else {
                v1C.priority = .init(900)
            }
        }
        
        UIView.animate(withDuration: 0.33) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
}

