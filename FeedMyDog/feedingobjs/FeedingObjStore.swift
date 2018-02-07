//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class FeedingObjStore: UITableViewDataSource {

    var feedingObjList = [FeedingObj]()



    @discardableResult func createFeedingObj(personFed: String) -> FeedingObj {

        //push to firebase

        let newFeedingObj = FeedingObj(personFed: personFed)
        feedingObjList.append(newFeedingObj)
        return newFeedingObj
    }


    //append values, one by one
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedingObjCell", for: indexPath) as! DateObjCell

        cell.backgroundColor = nil

        prepareCell(cell, row: indexPath.row)
        return cell
    }

    //row set
    private func prepareCell(_ cell: DateObjCell, row: Int) {
        let feedingObj = feedingObjList[row]

        //name
        cell.dateLabel?.text = feedingObj.date

        showFedIndication(cell.fedIndicationIV, feedingObj.personFed != nil)

    }


    private func showFedIndication(_ fedIV: UIImageView, _ fed: Bool) {
        if fed {
            fedIV.image = UIImage(named: ResourcesBank.FED_YES)
        } else {
            fedIV.image = UIImage(named: ResourcesBank.FED_NO)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedingObjList.count
    }

}
