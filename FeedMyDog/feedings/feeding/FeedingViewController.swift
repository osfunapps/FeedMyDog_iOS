//
// Created by Oz Shabat on 01/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import UIKit

class FeedingViewController: UIViewController {

    @IBOutlet var fedByLabel: UILabel!
    @IBOutlet var fedByTF: UITextField!
    @IBOutlet var jessikaIV: UIImageView!

    var dateObj: FeedingObj! {
        didSet {
            navigationItem.title = dateObj!.date
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let personFed = dateObj.personFed {
            jessikaIV.image = UIImage(named: AppFinals.FED_YES)
            fedByTF.text = personFed
            hideViews(false)
        } else {
            jessikaIV.image = UIImage(named: AppFinals.FED_NO)
            hideViews(true)
        }

    }

    private func hideViews(_ show: Bool) {
        fedByLabel.isHidden = show
        fedByTF.isHidden = show
    }
}
