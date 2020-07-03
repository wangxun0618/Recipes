//
//  HomeViewModel.swift
//  Recipes
//
//  Created by xun wang on 2020/6/4.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI
import Combine
import Alamofire

enum RecipesType: String {
    case hotest = "hotest"        //热门食谱
    case verified = "verified"    //达人食谱
    case exclusive = "exclusive"  //独家食谱
    case latest = "latest"        //最新食谱
}

//https://api.jiaonizuocai.com/v4/home/getVipHomeList?tabId=1&page=4

class HomeViewModel: ObservableObject {
    @Published private(set) var hotRecipes: [RecipesModel] = []
    @Published private(set) var latestRecipes: [RecipesModel] = []
    
    func getRecipes(id: String? = "0",
                    type: RecipesType) {
        
//        let params = ["id" : id ?? "0", "type": type.rawValue]
        let params = ["auth_token":"1","page":"1"]
        
        let targetType = IAskAPITargetType(method: .post, baseUrl: "https://icook.tw/api/v1/recipes/popular.json", path: nil, params: params, headers: nil)
        
        IAskRequestManager.share.requestByTargetType(targetType: targetType, success: { (model: IAskBaseModel<[RecipesModel]>?, dict) in
            
            if type == .hotest {
                self.hotRecipes = Array((model?.list ?? [])[0..<10])
            }
            
            if type == .latest {
                self.latestRecipes = model?.list ?? []
            }
            
        }, failed: { (error) in
            
        })
        
    }
    
    
    
}

struct HomeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
