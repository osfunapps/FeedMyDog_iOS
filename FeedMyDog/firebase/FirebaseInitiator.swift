//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation
import Firebase

class FirebaseInitiator{

    //params
    static var uid:String?

    //make the anonymous user
    public static func configureFirebase() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously() { (user, error) in
            if error != nil {
                FirebaseInitiator.uid = user!.uid
            }
        }
    }

}
