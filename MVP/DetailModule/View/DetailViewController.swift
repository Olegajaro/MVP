//
//  DetailViewController.swift
//  MVP
//
//  Created by Олег Федоров on 28.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        detailLabel.text = comment?.body
    }
}
