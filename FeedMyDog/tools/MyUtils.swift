//
// Created by Oz Shabat on 02/02/2018.
// Copyright (c) 2018 osApps. All rights reserved.
//

import Foundation
import UIKit

class MyUtils {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        //formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()


    public static func formatDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    public static func ShowAlertBoxWithInput(viewController: UIViewController,
                                             title: String, inputPlaceHolder: String,
                                             input: String?, positiveBtn: String, negativeBtn: String,
                                             completion: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alertController.addTextField {
            (textField) -> Void in
            if let input = input {
                textField.text = input
            }
            textField.placeholder = inputPlaceHolder
            textField.autocapitalizationType = .words
        }

        let okAction = UIAlertAction(title: positiveBtn, style: .default) {
            (action) -> Void in

            if let tfInput = alertController.textFields?.first?.text {
                completion(tfInput)
            } else {
                completion(nil)
            }
        }

        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: negativeBtn, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }

    //a simple choice dialog
    public static func ShowChoiceDialog(viewController: UIViewController,
                                        title: String, content: String, positiveBtn: String, negativeBtn: String,
                                        completion: @escaping (Bool) -> Void) {

        let alertController = UIAlertController(title: title, message: content, preferredStyle: .alert)


        let okAction = UIAlertAction(title: positiveBtn, style: .default) {
            (action) -> Void in
            completion(true)
        }

        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: negativeBtn, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }

    //a simple info dialog with only "ok"
    public static func ShowInformationDialog(viewController: UIViewController,
                                        title: String, content: String, naturalBtn: String,
                                        completion: @escaping (Bool) -> Void) {

        let alertController = UIAlertController(title: title, message: content, preferredStyle: .alert)


        let okAction = UIAlertAction(title: naturalBtn, style: .default) {
            (action) -> Void in
            completion(true)
        }

        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }


}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController!
            }
        }
        return nil
    }
}

