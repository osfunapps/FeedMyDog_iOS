//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation

class FeedingObj: NSObject{

    var date: String
    var personFed: String?

    init(personFed: String) {
        self.personFed = personFed
        self.date = MyUtils.formatDate(date: Date())

        super.init()
    }

    override init() {
        self.date = MyUtils.formatDate(date: Date())

        super.init()
    }


}
