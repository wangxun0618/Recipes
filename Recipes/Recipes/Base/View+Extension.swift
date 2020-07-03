//
//  View+Extension.swift
//  Recipes
//
//  Created by xun wang on 2020/5/29.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

extension View {
        
    func setNavigationBarBackgroundImage(image: UIImage) {
        UINavigationBar.appearance().setBackgroundImage(image, for: .default)
    }

}
