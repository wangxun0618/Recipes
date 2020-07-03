//
//  HomeView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            HomeTableView()
                .navigationBarTitle("菜谱",displayMode: .inline)
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

struct HomeTableView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    init() {
        self.homeViewModel.getRecipes(id: "0", type: .hotest)
        self.homeViewModel.getRecipes(id: "0", type: .latest)
    }
    
    var body: some View {
        List {
            Section(header: SectionHeaderView(text: "热门菜谱")) {
                HotReciperView(hotRecipes: self.homeViewModel.hotRecipes)
            }
            .listRowBackground(backgroundColor)
            
            Section(header: SectionHeaderView(text: "最新菜谱")) {
                ForEach (homeViewModel.latestRecipes) { model in
                    LastestRecipesView(recipe: model)
                        .shadow(radius: 4)
                        .overlay(RoundedRectangle(cornerRadius: 4, style:  .continuous).stroke(Color.white))
                        .padding(.bottom, 15)
                }
            }
        }
        .listRowBackground(backgroundColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

