//
//  DatesTableView.swift
//  FeedMyDog
//
//  Created by Oz Shabat on 01/02/2018.
//  Copyright © 2018 osApps. All rights reserved.
//

import UIKit


class FeedingsController: UIViewController {

    //feedings store
    var feedingObjStore: FeedingObjStore!
    var feedingsDataSource = FeedingsDataSource()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
        feedingsDataSource.feedingStore = self.feedingObjStore
        tableView.dataSource = feedingsDataSource
        setFbListenerOnDateQueries()
    }

    private func setFbListenerOnDateQueries() {
        feedingObjStore.setListenerOnQueries { (saved) -> Void in
            if saved {
                self.feedingsDataSource.feedingStore = self.feedingObjStore
                self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        }
    }

    private func setAppearance() {
        //row height
        tableView.rowHeight = UIScreen.main.bounds.height/6
        tableView.estimatedRowHeight = 65

    }

    private let _ALERT_TITLE = "Add Feeding"
    private let _ALERT_PLACE_HOLDER = "who fed?"
    private let _ALERT_POSITIVE_BTN = "Ok"
    private let _ALERT_NEGATIVE_BTN = "Cancel"
    private let _SENDER_ALERT_BOX = "alertBox"

    //add a row
    @IBAction func addNewDate(_ sender: UIMenuItem) {

        if self.feedingObjStore.objectAlreadySaved() {
            return
        }

        var personFed: String?
        if let name = PreferencesManager.getInstance().loadPrefs(strKey: AppFinals.KEY_PERSON_FED){
            personFed = name as? String
        }

        MyUtils.ShowAlertBoxWithInput(viewController: self,
                title: _ALERT_TITLE,
                inputPlaceHolder: _ALERT_PLACE_HOLDER,
                input: personFed,
                positiveBtn: _ALERT_POSITIVE_BTN,
                negativeBtn: _ALERT_NEGATIVE_BTN) { (personFed) -> Void in
            if let personFed = personFed {
                PreferencesManager.getInstance().savePrefs(strKey: AppFinals.KEY_PERSON_FED, strVal: personFed)
                self.feedingObjStore.addFeedingObj(personFed: personFed) { (saved) -> Void in
                    if saved {
                        //move to next segue
                        self.performSegue(withIdentifier: "openDate", sender: self._SENDER_ALERT_BOX)
                        print("added!")
                    }
                }
            }

        }
    }


    //segue --> call new item
    //new intent(new activity(this, DateController.class)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        //if the segue is 'showItem' segue
        switch segue.identifier {
        case "openDate"?:
            var row: Int = 0
            if sender is UITableViewCell {
                row = tableView.indexPathForSelectedRow!.row
            }

            //find the tapped row
                //find the item associated with the row
                let clickedDateItem = feedingObjStore.feedingObjList[row]
                let feedingViewController = segue.destination as! FeedingViewController
                feedingViewController.dateObj = clickedDateItem

        default:
            preconditionFailure("what is this segue? for ants?")

        }

    }

    //will be called after come back from navigation and on start
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}


