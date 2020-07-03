//
//  HotReciperView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/28.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct HotReciperView: View {
    var hotRecipes: [RecipesModel] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 15) {
                ForEach(hotRecipes) {recipes in
                    NavigationLink(destination: RecipesDetailView()) {
                        HotReciperItem(model: recipes)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(height: 128)
        }
    }
}

struct HotReciperItem: View {
    let model: RecipesModel
    var body: some View {
        
        KFImage(URL(string: kImageURL(model.imageid)))
            .resizable()
            .frame(width: 208, height: 128)
            .aspectRatio(contentMode: .fit)
            .clipped()
            .background(Color.white)
            .cornerRadius(4)
    }
}




struct HotReciperView_Previews: PreviewProvider {
    static var previews: some View {
        HotReciperView()
    }
}
