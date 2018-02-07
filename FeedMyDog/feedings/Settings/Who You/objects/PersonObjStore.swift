//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class PersonObjStore: NSObject {

    var personObjList = [PersonObj]()


    func loadDocumentOnce(completion: @escaping (Bool) -> Void) {
        //get all of the information from firebase
        FirebaseHandler.loadDocumentOnce(collectionName: FirebaseFinals.REF_COLLECTION_SETTINGS,
                pathToDocument: FirebaseFinals.REF_PERSONS) { (documentResult) -> Void in
            switch documentResult {
         
                
            //if data is missing, return
            case let .success(queryDocument):
                guard let data = queryDocument.data() else {
                    completion(false)
                    return
                }
                
                self.personObjList.removeAll()
                
                
                //run on all of the names
                for (key, personJsonObject) in data {
                    let personObj = PersonObj()
                    personObj.name = key
                    let personJsonDict = personJsonObject as! Dictionary<String, String>
                    
                    for (key,val) in personJsonDict {
                        if (key == FirebaseFinals.REF_DESCRIPTION) {
                            personObj.pDescription = val
                        }
                    }
                    
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
