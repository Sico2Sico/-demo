//
//  Emitterable.swift
//  粒子动画
//
//  Created by wudezhi on 2017/5/17.
//  Copyright © 2017年 RWUIControls. All rights reserved.
//

import UIKit

protocol Emitterable {
    
}


extension Emitterable where Self:UIViewController {
    
    func startEmittering(_ point :CGPoint){
        
        // 1 创建发射器
        let emitter = CAEmitterLayer()
        
        // 2 设置发生器的位子
        emitter.emitterPosition = point
        
        // 3 开启三维效果
        emitter.preservesDepth = true
        
        // 4 创建例子 并且设置例子相关的属性
        var  cells = [CAEmitterCell]()
        
        for i in 0..<10{
            
            //4.1 创建粒子cell
            let  cell = CAEmitterCell()
            //4.2 设置粒子的速度
            cell.velocity = 150
            cell.velocityRange = 100
            
            //4.3 设置粒子的大小
            cell.scale = 0.7
            cell.scaleRange = 0.3
            
            //4.4 设置粒子的方向
            cell.emissionLongitude = CGFloat(-M_PI_2)
            cell.emissionRange = CGFloat(M_PI_2/6)
            
            //4.5 设置粒子的存活时间
            cell.lifetime = 3
            cell.lifetimeRange = 1.5
            
            //4.6 设置粒子的旋转
            cell.spin = CGFloat(M_PI_2)
            cell.scaleRange = CGFloat(M_PI_2/2)
            
            //4.7 设置粒子每秒弹出的个数
            cell.birthRate = Float(CGFloat(arc4random_uniform(5)))
            
            //4.8  设置粒子展示的图片
            cell.contents = UIImage(named: "good\(i)_30x30")?.cgImage

            //4.9 添加到数组中
            cells.append(cell)
            
        }
        
        // 5 奖粒子设置到发射器中
        emitter.emitterCells = cells
        
        // 6 将发射器的layer添加到父layer中
    
        view.layer.addSublayer(emitter)
    }
    

    func  stopEmittering(){
    
        
        view.layer.sublayers?.filter({$0.isKind(of: CAEmitterLayer.self)}).first?.removeFromSuperlayer()
    
    }
    
    
}
