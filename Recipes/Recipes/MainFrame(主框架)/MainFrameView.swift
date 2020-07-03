//
//  MainFrameView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct MainFrameView: View {

    @State var selected = 0
    
    init() {
        UITableView.appearance().backgroundColor = backgroundUIColor
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        
        self.setNavigationBarBackgroundImage(image: backgroundImage)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                
                HomeView().tabItem() {
                    Image("ic_home" + (selected == 0 ? "_selected" : "" ))
                    Text("首页")
                }
                .tag(0)
                
                SpeciesView().tabItem(){
                    Image("ic_recipes"  + (selected == 1 ? "_selected" : "" ))
                    Text("分类")
                }
                .tag(1)
                
                LikeView().tabItem{
                    Image("ic_favorites"  + (selected == 2 ? "_selected" : "" ))
                    Text("喜欢")
                }
                .tag(2)
                
                MineView().tabItem{
                    Image("ic_profile"  + (selected == 3 ? "_selected" : "" ))
                    Text("我的")
                }
                .tag(3)
            }.accentColor(Color(hex: 0xFF8C2B))
        
        }
    }
}

struct MainFrameView_Previews: PreviewProvider {
    static var previews: some View {
        MainFrameView()
    }
}
