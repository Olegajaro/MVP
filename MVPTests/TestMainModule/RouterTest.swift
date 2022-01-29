//
//  RouterTest.swift
//  MVPTests
//
//  Created by Олег Федоров on 29.01.2022.
//

import XCTest
@testable import MVP

class MockNavigationContoller: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationContoller()
    let assembly = AssemblyModuleBuilder()


    override func setUpWithError() throws {
        router = Router(navigationController: navigationController,
                        assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() throws {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }
}
