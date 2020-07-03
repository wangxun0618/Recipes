//
//  LastestRecipesView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/28.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct LastestRecipesView: View {
    var recipe: RecipesModel?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            KFImage(URL(string: kImageURL(recipe?.imageid ?? "")))
                .resizable()
                .frame(width: 344, height: 300, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("HEALTHY")
                    .foregroundColor(Color(hex: 0x9E9E9E))
                    .font(Font.system(size:10))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
                
                Text("Pasta Salad")
                    .foregroundColor(Color(hex: 0x333333))
                    .font(Font.system(size:16))
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                HStack {
                    centerButton(image: "ic_duration", title: "15 minutes")
                    Spacer()
                    centerButton(image: "ic_difficulty", title: "Easy")
                    Spacer()
                    centerButton(image: "ic_difficulty", title: "\(recipe?.collectCount ?? "0") People")
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                }
            .background(Color.white)
            .shadow(radius: 0)
            
        }
    }
}

struct centerButton: View {
    var image: String
    var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Button(action: {
                }) {
                    HStack {
                        Image(image)
                        Text(title)
                            .font(Font.system(size: 13))
                            .foregroundColor(Color(hex: 0x9E9E9E))
                    }
                    }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct LastestRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        LastestRecipesView()
    }
}
