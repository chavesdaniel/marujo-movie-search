//
//  UIViewController+Ext.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 28/02/22.
//

import UIKit

extension UIViewController {
    func presentMSAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = MSAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
