//
//  DatesTableView.swift
//  FeedMyDog
//
//  Created by Oz Shabat on 01/02/2018.
//  Copyright © 2018 osApps. All rights reserved.
//

import UIKit


class SettingsController: UIViewController {

    //feedings store
    var settingsDataSource = SettingsDataSource()
    let settingsStore: SettingsObjStore = SettingsObjStore()
    @IBOutlet var settingsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
        settingsDataSource.settingsStore = self.settingsStore
        settingsTV.dataSource = settingsDataSource
        setFbListenerOnDateQueries()
    }

    private func setFbListenerOnDateQueries() {
        settingsStore.setListenerOnQueries { (saved) -> Void in
            if saved {
                self.settingsDataSource.settingsStore = self.settingsStore
                self.settingsTV.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        }
    }
    

    private func setAppearance() {
        //row height
        self.settingsTV.rowHeight = UIScreen.main.bounds.height/11
        self.settingsTV.estimatedRowHeight = 65

    }


    //will be called after come back from navigation and on start
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsTV.reloadData()
    }

}


