//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class PersonObjStore: NSObject {

    var personObjList = [PersonObj]()


    func setListenerOnQueries(completion: @escaping (Bool) -> Void) {
        //get all of the information from firebase
        FirebaseHandler.loadFbDocumentsOnce(path: FirebaseFinals.REF_SETTINGS_PERSONS) { (firebaseLoadResult) -> Void in
            switch firebaseLoadResult {
            case let .success(queryDocument):
                self.personObjList.removeAll()
                for specificDateQuery in queryDocument {
                    let personObj = PersonObj()

                    //see the objects here!
                    personObj.name = specificDateQuery.documentID
                  /*  for (key, value) in specificDateQuery.data() {
                        if key == FirebaseFinals.REF_PERSON_FED {
                            personObj.personFed = (value as! String)
                        }
                    }*/
                    self.personObjList.append(personObj)
                }

                //sort alphabetically
                self.personObjList = self.personObjList.sorted(by: {$0.name < $1.name } )
                completion(true)

            case .failure(_):
                completion(false)
            }
        }
    }


}
