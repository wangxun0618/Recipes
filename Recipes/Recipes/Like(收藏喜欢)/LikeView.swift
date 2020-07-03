//
//  LikeView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
        NavigationView {
            LikeTableView()
                .navigationBarTitle("喜欢",displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    
                }) {
                    Image("")
                }.buttonStyle(PlainButtonStyle()), trailing: Button(action: {
                    
                }) {
                    Image("ic_search")
                }.buttonStyle(PlainButtonStyle())
            )
            
        }
    }
}

struct LikeTableView: View {
    
    var body: some View {
        List() {
            ForEach (0 ..< 5) { i in
                LastestRecipesView().shadow(radius: 4)
                    .overlay(RoundedRectangle(cornerRadius: 4, style:  .continuous).stroke(Color.white))
                    .padding(.bottom, 15)
            }
        }
    }
}


struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
