//
//  MainPresenterTest.swift
//  MVPTests
//
//  Created by Олег Федоров on 27.01.2022.
//

import Foundation
import XCTest

@testable import MVP

class MockView: MainViewProtocol {
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class Test: XCTestCase {
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    override func setUp() {
        super.setUp()
        
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }
    
    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil()  {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }
}
