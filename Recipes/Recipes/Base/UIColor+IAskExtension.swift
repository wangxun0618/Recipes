//
//  UIColor+IAskExtension.swift
//  SinaHealth
//
//  Created by lmy on 2019/1/21.
//  Copyright © 2019 lmy. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: -用数值初始化颜色，便于生成设计图上标明的十六进制颜色
    convenience init(hex: UInt, alpha: CGFloat? = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha!
        )
    }
    
    //MARK: -返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    //颜色转图片
    func imageWithColor() ->UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.setFillColor(self.cgColor)
        ctx!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
