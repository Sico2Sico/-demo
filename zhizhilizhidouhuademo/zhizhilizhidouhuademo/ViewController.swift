//
//  ViewController.swift
//  zhizhilizhidouhuademo
//
//  Created by wudezhi on 2017/5/17.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

import UIKit

class ViewController: UIViewController,Emitterable {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    
    
    func setupUI(){
        
        let  button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        view.addSubview(button)
        
        button.center.x = self.view.center.x
        button.center.y = self.view.frame.maxY - 20
        button.backgroundColor = UIColor.red
        button.addTarget(self, action:#selector(bottomMenuClick(_ :)), for:UIControlEvents.touchUpInside)
        
    }
    
    
    func bottomMenuClick(_ sender : UIButton){
        
        sender.isSelected = !sender.isSelected
        let point  = CGPoint(x: sender.center.x, y: view.frame.maxY + 50)
        let point1  = CGPoint(x: sender.center.x - 100, y: view.frame.maxY + 50)
        let point2  = CGPoint(x: sender.center.x + 100, y: view.frame.maxY + 50)
        
        sender.isSelected ? startEmittering(point): stopEmittering()
        sender.isSelected ? startEmittering(point1): stopEmittering()
        sender.isSelected ? startEmittering(point2): stopEmittering()

    }

}

