//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation

class PersonObj: NSObject {

    private var _name: String!
    private var _description: String?

    var pDescription: String? {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }

    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }




}
