//
//  MineView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct MineView: View {
    var body: some View {
        NavigationView {
//            Text("MINE").navigationBarTitle("我的",displayMode: .inline)
            
        KFImage(URL(string: kImageURL("264597212")))
            .resizable()
            .frame(width: 208, height: 128)
        }
    }
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView()
    }
}
