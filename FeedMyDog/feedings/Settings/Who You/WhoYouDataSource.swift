//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class WhoYouDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var personStore: PersonObjStore?

    //append values, one by one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WhoYouObjCell", for: indexPath) as! WhoYouObjCell

        let personObj = personStore!.personObjList[indexPath.row]

        //name and description

        cell.personNameLabel.text = personObj.name.firstUpperCased
        if let personDescription =  personObj.pDescription {
            cell.personDescriptionLabel.text = personDescription
        }

        //image
        cell.personIV.image = UIImage(named: personObj.name)

        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personStore!.personObjList.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let personObjList = personStore?.personObjList, let parentController =  tableView.parentViewController else {
            return
        }

        let selectedPersonObj = personObjList[indexPath.row]

        //save the new person in settings
        PreferencesManager.getInstance().savePrefs(strKey: AppFinals.KEY_PERSON_FED, strVal: selectedPersonObj.name)

            MyUtils.ShowInformationDialog(
                    viewController: parentController,
                    title: AppFinals._INFORMATION_DIALOG_TITLE,
                    content: AppFinals._INFORMATION_DIALOG_CONTENT + selectedPersonObj.name,
                    naturalBtn: AppFinals._OK){(clickedFine) -> Void in }
    }

}


//first letter upper case handling
extension String {
    var firstUpperCased: String{
        guard let first = first else {return ("")}
        return String(first).uppercased() + dropFirst()
    }

}
