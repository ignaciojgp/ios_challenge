//
//  RecipeDetailRouter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeDetailRouter: NSObject, RecipeDetailRouterProtocol {
    
    
    static func launch(origin:UIViewController, mealId:String){
        
        let presenter = RecipeDetailPresenter()
        let interactor = RecipeDetailInteractor()
        let router = RecipeDetailRouter()
        
        
        let view = RecipeDetailViewController(nibName: "RecipeDetailViewController", bundle: Bundle.main)
        
        presenter.mealID = mealId
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        presenter.view?.presenter = presenter
        presenter.interactor?.presenter = presenter
        
        
        if let navigator = origin.navigationController{
            navigator.pushViewController(view, animated: true)
        }else{
            origin.present(view, animated: true, completion: nil)

        }

        
        
    }
    
    static func initModule(viewref: UIViewController & RecipeDetailViewProtocol ) {
        
    }

    
    
    
}
