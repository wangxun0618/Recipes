//
//  SectionHeaderView.swift
//  Recipes
//
//  Created by xun wang on 2020/6/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct SectionHeaderView: View {
    var text: String? = nil
    var bgColor: Color? = backgroundColor
    var alignment: Alignment? = .leading
    var body: some View {
        
        Text(text ?? "")
            .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
            .frame(width: kScreenWidth, height: 60, alignment: alignment ?? .leading)
            .background(bgColor)

        
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView()
    }
}
