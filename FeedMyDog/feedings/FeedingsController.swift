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
    @IBOutlet var feedingsTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
        feedingsDataSource.feedingStore = self.feedingObjStore
        feedingsTV.dataSource = feedingsDataSource
        setFbListenerOnDateQueries()
        
        //if person isn't sed,
        if PreferencesManager.getInstance().loadPrefs(strKey: AppFinals.KEY_PERSON_FED) == nil{
            self.performSegue(withIdentifier: "showPersonFed", sender: nil)
        }
    }

    private func setFbListenerOnDateQueries() {
        feedingObjStore.setListenerOnQueries { (saved) -> Void in
            if saved {
                self.feedingsDataSource.feedingStore = self.feedingObjStore
                self.feedingsTV.reloadSections(IndexSet(integer: 0), with: .automatic)
            }
        }
    }


    private func setAppearance() {
        //row height
        self.feedingsTV.rowHeight = UIScreen.main.bounds.height / 6
        self.feedingsTV.estimatedRowHeight = 65

    }

    private let _ALERT_TITLE = "Add a Feeding"
    private let _ALERT_CONTENT = "I will add feeding to jesiky today"
    private let _ALERT_POSITIVE_BTN = "Ok"
    private let _ALERT_NEGATIVE_BTN = "Cancel"
    private let _SENDER_ALERT_BOX = "alertBox"

    //add a row
    @IBAction func addNewDate(_ sender: UIMenuItem) {


        MyUtils.ShowChoiceDialog(viewController: self,
                title: _ALERT_TITLE,
                content: _ALERT_CONTENT,
                positiveBtn: _ALERT_POSITIVE_BTN,
                negativeBtn: _ALERT_NEGATIVE_BTN) { (jessikaAte) -> Void in
            if jessikaAte {
                if let personFed = PreferencesManager.getInstance().loadPrefs(strKey: AppFinals.KEY_PERSON_FED) as? String {
                    self.feedingObjStore.addFeedingObj(personFed: personFed) { (saved) -> Void in
                        if saved {
                            //move to next segue
                            self.performSegue(withIdentifier: "openDate", sender: self._SENDER_ALERT_BOX)
                            print("added as \(personFed)")
                        }
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
                row = feedingsTV.indexPathForSelectedRow!.row
            }

            //find the tapped row
            //find the item associated with the row
            let clickedDateItem = feedingObjStore.feedingObjList[row]
            let feedingViewController = segue.destination as! FeedingViewController
            feedingViewController.dateObj = clickedDateItem


//        case "showSettings":
//            segue.destination as!
            
            
        default:
            print("opening somShit")
//            preconditionFailure("what is this segue? for ants?")

        }

    }

    //will be called after come back from navigation and on start
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedingsTV.reloadData()
    }

}


