//
//  MovieInfoVC.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 03/03/22.
//

import UIKit

class MovieInfoVC: UIViewController {
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor                = .systemBackground
        let doneButton                      = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem   = doneButton
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
