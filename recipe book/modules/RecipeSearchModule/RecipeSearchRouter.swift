//
//  RecipeSearchRouter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeSearchRouter: NSObject, RecipeSearchRouterProtocol {
    static func initModule(viewref: RecipeSearchViewProtocol ) {
        
        
        let presenter = RecipeSearchPresenter()
        let interactor = RecipeSearchInteractor()
        let router = RecipeSearchRouter()
        
        presenter.interactor = interactor
        presenter.view = viewref
        presenter.router = router
        
        interactor.presenter = presenter
        presenter.view?.presenter = presenter

        
    }
    
    
   
    

}
