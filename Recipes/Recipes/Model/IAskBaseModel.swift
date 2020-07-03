//
//  IAskBaseModel.swift
//  IAskDoctorNew
//
//  Created by xun wang on 2020/5/19.
//  Copyright © 2020 IAsk. All rights reserved.
//

import UIKit
import HandyJSON

struct IAskBaseModel<T>: HandyJSON {
    
    var state: Int? = nil
    var list: T? = nil
    var message: String? = nil
    
}
