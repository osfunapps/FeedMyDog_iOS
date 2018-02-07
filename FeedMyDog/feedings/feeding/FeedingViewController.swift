//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class FeedingViewController: UIViewController {

    //views
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var fedByLabel: UILabel!
    @IBOutlet var jessikaIV: UIImageView!

    //statics
    private let _DATE_PREFIX = "in "
    private let _DATE_SUFFIX = "."
    private let _FED_PREFIX = "Jessika fed by "
    private let _FED_SUFFIX = ","
    private let _FED_NOBODY = "Nobody fed Jessika"

    //feeding obj
    var dateObj: FeedingObj!


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        dateLabel.text = _DATE_PREFIX + dateObj!.date + _DATE_SUFFIX
        if let personFed = dateObj.personFed {
            jessikaIV.image = UIImage(named: personFed.lowercased())
            fedByLabel.text = _FED_PREFIX + personFed + _FED_SUFFIX
        } else {
            jessikaIV.image = UIImage(named: AppFinals.FED_NO)
            fedByLabel.text = _FED_NOBODY + _FED_SUFFIX
        }

    }
}
