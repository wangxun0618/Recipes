//
//  RecipesDetailView.swift
//  Recipes
//
//  Created by xun wang on 2020/6/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct RecipesDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            RectipesTableView()        .edgesIgnoringSafeArea(.top)
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("ic_arrow_back_white")
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image("ic_favorite")
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct RectipesTableView: View {
    var body: some View {
        List {
            Section {
                RecipesDetailHeaderView().listRowInsets(EdgeInsets())
            }
            Section(header: SectionHeaderView(text:"INGREDIENTS", alignment: .center)) {
                ForEach (0 ..< 10) { i in
                    RectipesDetailRowView(size: 8)
                        .padding(.bottom, 15)
                }
            }
            
            Section(header: SectionHeaderView(text: "INSTRUCTIONS", alignment: .center)) {
                ForEach (0 ..< 10) { i in
                    RectipesDetailRowView(size: 16, step: "1")
                    .padding(.bottom, 15)
                }
            }
            
        }
    }
}

struct RecipesDetailHeaderView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            
            Image("").resizable()
                .background(Color.yellow)
                .frame(height: 192, alignment: .top)
            
            Text("CATEGORY")
                .font(Font.system(size: 10))
                .foregroundColor(Color(hex: 0x9E9E9E))
            Text("Breadfast & Brunch")
                .font(Font.system(size: 20))
                .foregroundColor(Color(hex: 0x333333))
            
            HStack {
                centerButton(image: "ic_duration", title: "15 minutes")
                Spacer()
                centerButton(image: "ic_difficulty", title: "Easy")
                Spacer()
                centerButton(image: "ic_difficulty", title: "6 People")
            }
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
        }
        .background(backgroundColor)
        
    }
    
}


struct RectipesDetailRowView: View {
    var size: CGFloat = 8
    var step: String? = ""
    var body: some View {
        
        HStack {
            Text(step ?? "")
                .frame(width: size, height: size, alignment: .center)
                .background(Color(UIColor(hex: 0xFF8C2B)))
                .font(Font.system(size: 10))
                .foregroundColor(Color.white)
                .cornerRadius(size/2)
            
            Text("1 (7 ounce) package rotini pasta or 1 (7 ounce) package other pastas, cooked and drained")
                .font(Font.system(size: 14))
            .foregroundColor(Color(hex: 0x333333))
        }
    }
}

struct RecipesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDetailView()
    }
}
