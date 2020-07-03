//
//  SpeciesDetailView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/29.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct SpeciesDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack(alignment: .top) {
            SpeciesDetailTableView()        .edgesIgnoringSafeArea(.top)
            
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
                    Image("ic_search_white")
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct SpeciesDetailTableView: View {
    
    var body: some View {
        
        List {
            Section() {
                SpeciesDetailHeaderView().listRowInsets(EdgeInsets())
            }
            
            Section {
                ForEach (0 ..< 5) { i in
                    LastestRecipesView().shadow(radius: 4)
                        .overlay(RoundedRectangle(cornerRadius: 4, style:  .continuous).stroke(Color.white))
                        .padding(.bottom, 15)
                }
            }
            .listRowBackground(backgroundColor)
        }

    }
}

struct SpeciesDetailHeaderView: View {
    
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
            Text("418 Recipes")
                .font(Font.system(size: 13))
                .foregroundColor(Color(hex: 0x9E9E9E))
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
        
    }
    
}


struct SpeciesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesDetailView()
    }
}
