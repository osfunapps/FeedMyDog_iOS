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

        //self.setCellAppearance(cell)
        let feedingObj = feedingStore!.feedingObjList[indexPath.row]

        //name
        cell.dateLabel?.text = feedingObj.date

        showFedIndication(cell.fedIndicationIV, feedingObj.personFed != nil)
        return cell
    }

    //shadow
    private func setCellAppearance(_ cell: FeedingObjCell) {
        cell.layer.shadowOffset = CGSize(width: 0.5, height: 1)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 1
        cell.layer.shadowOpacity = 0.6

        // Maybe just me, but I had to add it to work:
        cell.clipsToBounds = false

        let shadowFrame: CGRect = (cell.layer.bounds)
        let shadowPath: CGPath = UIBezierPath(rect: shadowFrame).cgPath
        cell.layer.shadowPath = shadowPath
    }

    private func setCellAppearance() {

    }

    private func showFedIndication(_ fedIV: UIImageView, _ fed: Bool) {
        if fed {
            fedIV.image = UIImage(named: AppFinals.FED_YES)
        } else {
            fedIV.image = UIImage(named: AppFinals.FED_NO)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedingStore!.feedingObjList.count
    }

}
