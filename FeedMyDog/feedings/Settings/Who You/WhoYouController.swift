//
//  DatesTableView.swift
//  FeedMyDog
//
//  Created by Oz Shabat on 01/02/2018.
//  Copyright © 2018 osApps. All rights reserved.
//

import UIKit


class WhoYouController: UIViewController {

    //feedings store
    var personsStore: PersonObjStore!
    var whoYouDataSource = WhoYouDataSource()
    @IBOutlet var personsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
        whoYouDataSource.personStore = self.personsStore
        personsTV.dataSource = whoYouDataSource
        setFbListenerOnDateQueries()
    }

    private func setFbListenerOnDateQueries() {
        personsStore.setListenerOnQueries { (saved) -> Void in
            if saved {
                self.whoYouDataSource.personStore = self.personsStore
                self.personsTV.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        }
    }
    

    private func setAppearance() {
        //row height
        self.personsTV.rowHeight = UIScreen.main.bounds.height/5
        self.personsTV.estimatedRowHeight = 65

    }


    //will be called after come back from navigation and on start
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        personsTV.reloadData()
    }

}


