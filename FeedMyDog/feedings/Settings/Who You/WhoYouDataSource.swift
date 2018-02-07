//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class WhoYouDataSource: NSObject, UITableViewDataSource {

    var personStore: PersonObjStore?

    //append values, one by one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonObjCell

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

}


//first letter upper case handling
extension String {
    var firstUpperCased: String{
        guard let first = first else {return ("")}
        return String(first).uppercased() + dropFirst()
    }

}