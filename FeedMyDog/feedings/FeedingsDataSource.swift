//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class FeedingsDataSource: NSObject, UITableViewDataSource {

    var feedingStore: FeedingObjStore?

    //append values, one by one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedingObjCell", for: indexPath) as! FeedingObjCell

        let feedingObj = feedingStore!.feedingObjList[indexPath.row]

        //date
        cell.dateLabel?.text = feedingObj.date
        cell.personFedLabel?.text = feedingObj.personFed
        
        if let personFed = feedingObj.personFed {
            cell.feedingIndicationIV.image = UIImage(named: personFed.lowercased())
        } else {
            cell.feedingIndicationIV.image = UIImage(named: AppFinals.FED_NO)
            cell.backgroundView?.backgroundColor = UIColor.red
        }
        
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedingStore!.feedingObjList.count
    }

}
