//
//  DetailPresenter.swift
//  MVP
//
//  Created by Олег Федоров on 28.01.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol,
         networkService: NetworkServiceProtocol,
         comment: Comment?
    )
    
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    var comment: Comment?
    
    required init(view: DetailViewProtocol,
                  networkService: NetworkServiceProtocol,
                  comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
}


