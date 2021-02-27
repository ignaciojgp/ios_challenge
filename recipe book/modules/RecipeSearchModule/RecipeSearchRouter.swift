//
//  RecipeSearchRouter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeSearchRouter: NSObject, RecipeSearchRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func initModule(viewref: UIViewController & RecipeSearchViewProtocol ) {
        
        
        let presenter = RecipeSearchPresenter()
        let interactor = RecipeSearchInteractor()
        let router = RecipeSearchRouter()
        
        presenter.interactor = interactor
        presenter.view = viewref
        presenter.router = router
        
        interactor.presenter = presenter
        presenter.view?.presenter = presenter

        router.viewController = viewref
    }
    
    func goToDetail(origin:UIViewController,  mealId: String) {
        RecipeDetailRouter.launch(origin: origin, mealId: mealId)
        
    }
    
   
    

}
