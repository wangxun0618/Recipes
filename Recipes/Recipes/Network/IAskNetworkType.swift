//
//  IAskNetworkType.swift
//  IAskDoctorNew
//
//  Created by xun wang on 2020/5/27.
//  Copyright © 2020 IAsk. All rights reserved.
//

import UIKit
import Alamofire

struct IAskAPITargetType {

    var method: RequestMethod = .get

    var baseUrl: String?

    var path: String?

    var params: Dictionary<String, Any>?

    var headers: HTTPHeaders?

}
