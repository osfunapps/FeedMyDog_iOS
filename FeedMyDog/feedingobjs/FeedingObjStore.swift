//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class FeedingObjStore: NSObject {

    var feedingObjList = [FeedingObj]()


    func setListenerOnQueries(completion: @escaping (Bool) -> Void) {
        //get all of the information from firebase
        FirebaseHandler.listenToCollection(path: FirebaseFinals.REF_FEEDINGS) { (firebaseLoadResult) -> Void in
            switch firebaseLoadResult {
            case let .success(queryDocument):
                self.feedingObjList.removeAll()
                for specificDateQuery in queryDocument {
                    let feedingObj = FeedingObj()
                    feedingObj.date = specificDateQuery.documentID
                    for (key, value) in specificDateQuery.data() {
                        if key == FirebaseFinals.REF_PERSON_FED {
                            feedingObj.personFed = (value as! String)
                        }
                    }
                    self.feedingObjList.append(feedingObj)
                }
                
                self.feedingObjList.reverse()
                completion(true)

            case .failure(_):
                completion(false)
            }
        }
    }


    func objectAlreadySaved() -> Bool {
        let currDate = MyUtils.formatDate(date: Date())
        if let lastFeedingObj = self.feedingObjList.first {
            return lastFeedingObj.date == currDate
        }
        return false
    }

    func addFeedingObj(personFed: String, completion: @escaping (Bool) -> Void) {

        //push to firebase
        let feedingObj = FeedingObj(personFed: personFed)
        FirebaseHandler.saveFeedingObject(feedingObj: feedingObj) { (saved) -> Void in
            completion(saved)
        }
    }


}
