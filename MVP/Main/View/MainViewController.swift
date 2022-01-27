//
//  MainViewController.swift
//  MVP
//
//  Created by Олег Федоров on 27.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IBAction
    @IBAction func didTapButtonAction(_ sender: Any) {
        presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
