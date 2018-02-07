//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class SettingsObjStore: NSObject {

    var settingsObjList = [SettingsObj]()


    func setListenerOnQueries(completion: @escaping (Bool) -> Void) {
        //get all of the information from firebase
        FirebaseHandler.loadCollectionOnce(path: FirebaseFinals.REF_COLLECTION_SETTINGS) { (firebaseLoadResult) -> Void in
            switch firebaseLoadResult {
            case let .success(queryDocument):
                self.settingsObjList.removeAll()
                for specificDateQuery in queryDocument {
                    let settingsObj = SettingsObj()

                    //see the objects here!
                    settingsObj.name = specificDateQuery.documentID
                    /*  for (key, value) in specificDateQuery.data() {
                          if key == FirebaseFinals.REF_PERSON_FED {
                              settingsObj.personFed = (value as! String)
                          }
                      }*/
                    self.settingsObjList.append(settingsObj)
                }

                //sort alphabetically
                self.settingsObjList = self.settingsObjList.sorted(by: { $0.name < $1.name })
                completion(true)

            case .failure(_):
                completion(false)
            }
        }
    }


}
