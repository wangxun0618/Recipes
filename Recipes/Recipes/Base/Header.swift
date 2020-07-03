//
//  Header.swift
//  Recipes
//
//  Created by xun wang on 2020/5/29.
//  Copyright © 2020 xun wang. All rights reserved.
//

import SwiftUI
import HandyJSON
@_exported import struct Kingfisher.KFImage

// type: hotest 热门食谱  verified 达人食谱  exclusive 独家食谱 latest 最新食谱
let recipesListURL = "http://api.ecook.cn/public/getRecipeListByType.shtml"


// 分类
let recipesClassifyURL = "http://api.ecook.cn/public/getRecipeHomeData.shtml"

// 搜索接口 queryString: 关键字
let searchRecipesListURL = "http://api.ecook.cn/public/searchRecipe.shtml"

// 图片前缀 http://pic.ecook.cn/web/263345447.jpg
func kImageURL(_ id:String) ->String { return "http://pic.ecook.cn/web/" + id + ".jpg" }


let backgroundUIColor = UIColor(hex: 0xF6F6F6,alpha: 1)

let backgroundColor = Color(hex: 0xF6F6F6,alpha: 1)

let backgroundImage = backgroundUIColor.imageWithColor()

let clearBackgroundImage = UIColor.clear.imageWithColor()

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
