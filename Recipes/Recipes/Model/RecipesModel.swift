//
//  RecipesModel.swift
//  Recipes
//
//  Created by xun wang on 2020/6/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

import HandyJSON
struct RecipesModel: HandyJSON, Identifiable {
    var id = ""
    var hasVideo: Bool = false
    var imageid: String = ""
    var collectCount = ""
    var description = ""
    var likeCount = ""
    var authorid = ""
    var type = ""
    var commentCount = ""
    var tags = [String]()
    var videourl = ""
    var authorname = ""
    var name = ""
    var exclusive = ""
    var viewCount = ""
    var authorimageid = ""
}
