//
//  Color+Extension.swift
//  Recipes
//
//  Created by xun wang on 2020/5/28.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

extension Color {
    //MARK: -用数值初始化颜色，便于生成设计图上标明的十六进制颜色
    init(hex: UInt, alpha: CGFloat? = 1) {
        self.init(UIColor(hex: hex, alpha: alpha))
    }
    
    static var randomColor: Color {
        get {
            let red = Double(arc4random()%256)/255.0
            let green = Double(arc4random()%256)/255.0
            let blue = Double(arc4random()%256)/255.0
            return Color(red: red, green: green, blue: blue)
        }
    }
}
