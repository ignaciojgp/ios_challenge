//
//  recipe_bookTests.swift
//  recipe bookTests
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import XCTest
@testable import recipe_book

class recipe_bookTests: XCTestCase, RecipeSearchInteractorListenerProtocol, RecipeDetailInteractorListenerProtocol {
    

    var promise:XCTestExpectation?
    
    override func setUpWithError() throws {
        self.promise = expectation(description: "Wait for async response")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecipeSearchInteractor() throws {
        
        let interactor = RecipeSearchInteractor()
        interactor.presenter = self
        interactor.loadData(search: "la")
        wait(for: [promise!], timeout: 10)

        
    }
    
    func testRecipeDetailInteractor() throws {
        
        
        let interactor = RecipeDetailInteractor()
        interactor.presenter = self
        interactor.loadRecipe(id: "52767")
        
        wait(for: [promise!], timeout: 10)

        
    }

    func onLoadDataSuccess(list: Array<Recipe>) {
        
        XCTAssertTrue(list.count > 0)

        promise?.fulfill()
    }
    
    func onLoadDataSuccess(recipe: RecipeDetail) {

        promise?.fulfill()

    }
    
    
    
    func onLoadDataFailure(description: String) {
        XCTFail()
    }
    
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
