//
//  recipe_bookTests.swift
//  recipe bookTests
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import XCTest
@testable import recipe_book

class recipe_bookTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecipeSearchInteractor() throws {
        
        let promise = expectation(description: "Wait for async response")
        
        let interactor = RecipeSearchInteractor()
        
        interactor.loadData(search: "la")
        
        
        wait(for: [promise], timeout: 100)

        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
