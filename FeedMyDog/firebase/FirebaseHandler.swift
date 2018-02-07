//
// Created by Oz Shabat on 31/01/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation
import Firebase

public class FirebaseHandler {


    static func listenToCollection(path: String, completion: @escaping (FireStoreCollectionLoadResult) -> Void) {
        let db = Firestore.firestore()

        db.collection(path).addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                completion(.failure(error!))
                return
            }
            
            let datesQuerySS = document.documents
            completion(.success(datesQuerySS))
        }
    }

    static func loadCollectionOnce(path: String, completion: @escaping (FireStoreCollectionLoadResult) -> Void) {
        let db = Firestore.firestore()
        db.collection(path).getDocuments() { (querySnapshot, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                let datesQuerySS = querySnapshot!.documents
                completion(.success(datesQuerySS))
            }
        }
    }
    
    static func loadDocumentOnce(collectionName: String, pathToDocument: String, completion: @escaping (FireStoreDocumentLoadResult) -> Void) {
        let db = Firestore.firestore()
        db.collection(collectionName).document(pathToDocument).getDocument { (querySnapshot, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                completion(.success(querySnapshot!))
            }
        }
    }

    /*   static func loadFbDocuments(path: String, completion: @escaping (FirebaseLoadResult) -> Void){
        let db = Firestore.firestore()
        db.collection(path).getDocuments() { (querySnapshot, err) in
            if let err = err {
                completion(.failure(err))
            } else {
                let datesQuerySS = querySnapshot!.documents
                completion(.success(datesQuerySS))
            }
        }
    }*/


    static func saveFeedingObject(feedingObj: FeedingObj, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()

        // Add a new document with a generated ID
        db.collection(FirebaseFinals.REF_FEEDINGS).document(feedingObj.date).setData([
            FirebaseFinals.REF_PERSON_FED: feedingObj.personFed

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }

}
