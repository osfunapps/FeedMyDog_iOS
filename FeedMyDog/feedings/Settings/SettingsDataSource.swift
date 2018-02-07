//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class SettingsDataSource: NSObject, UITableViewDataSource {

    var settingsStore: SettingsObjStore?

    //append values, one by one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsObjCell", for: indexPath) as! SettingsObjCell

        let settingsObj = settingsStore!.settingsObjList[indexPath.row]

        //name and description


        cell.settingsLabel.text = settingsObj.name.replacingOccurrences(of: "_", with: " ").capitalized
        cell.settingsIV.image = UIImage(named: settingsObj.name)
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsStore!.settingsObjList.count
    }

}
