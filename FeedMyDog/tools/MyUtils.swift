//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation

class MyUtils {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    public static func formatDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }


}