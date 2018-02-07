//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation
import Firebase


enum FireStoreCollectionLoadResult {
    case success([QueryDocumentSnapshot])
    case failure(Error)
}

enum FireStoreDocumentLoadResult {
    case success(DocumentSnapshot)
    case failure(Error)
}

enum FireStoreSaveResult {
    case success(FeedingObj)
    case failure(Error)
}

enum FireStoreQueriesToObjResult {
    case success([FeedingObj])
    case failure(Error)
}

