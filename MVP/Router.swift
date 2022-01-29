//
//  Router.swift
//  MVP
//
//  Created by Олег Федоров on 29.01.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterMain {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(
        navigationController: UINavigationController,
        assemblyBuilder: AssemblyBuilderProtocol
    ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
}

extension Router: RouterProtocol {
    func initialViewController() {
        if let navigationController = navigationController {
            guard
                let mainViewController = assemblyBuilder?.createMainModule(router: self)
            else { return }
            
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard
                let detailViewController = assemblyBuilder?.createDetailModule(
                    comment: comment, router: self
                )
            else { return }
            
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
 
