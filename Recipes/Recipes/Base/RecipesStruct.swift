//
//  RecipesStruct.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct RecipesStruct<T> {
        
    var title: String?
    var image: String?
    var selectedImage: String?
    var type: T?
    var coustom: Any?
    
    init(title: String? = nil,
         image: String? = nil,
         selectedImage: String? = nil,
         type: T? = nil,
         coustom: Any? = nil) {
        
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.type = type
        self.coustom = coustom
    }
    
}

