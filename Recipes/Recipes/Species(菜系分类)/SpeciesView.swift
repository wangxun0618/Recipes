//
//  SpeciesView.swift
//  Recipes
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI

struct SpeciesView: View {
    
    var body: some View {
        NavigationView {
            SpeciesTableView()
                .navigationBarTitle("分类",displayMode: .inline)
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

struct SpeciesTableView: View {
    
    var body: some View {
        List() {
            ForEach (0 ..< 5) { i in
                HStack(alignment: .center) {
                    NavigationLink(destination: SpeciesDetailView()
                    ) {
                        
                        HStack {
                            Spacer()
                            Text("APPETIZER")
                            Spacer()
                        }
                        .frame(height: 56, alignment: .leading)
                        .background(Color(.white))
                        .cornerRadius(4)
                    }
                }
                .listRowBackground(backgroundColor)
            }
        }
    }
}


struct SpeciesView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView()
    }
}

