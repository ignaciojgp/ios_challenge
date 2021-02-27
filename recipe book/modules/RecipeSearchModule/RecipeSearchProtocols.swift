//
//  RecipeSearchProtocols.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import Foundation
import UIKit

protocol RecipeSearchPresenterProtocol {
    
    var view:RecipeSearchViewProtocol?{get set}
    var interactor:RecipeSearchInteractorProtocol?{get set}
    var router:RecipeSearchRouterProtocol?{get set}
    
    
}

/* view protocols */
protocol RecipeSearchViewProtocol {
    var presenter: RecipeSearchViewDelegate?{get set}
    
    func showRecipeList(list:Array<Recipe>)
    func showBannerWith(recipe:Recipe)
    func showError(message:String )
    
    
}

protocol RecipeSearchViewDelegate{
    func searchRecipe(search:String)
    func viewDidLoad()
    func userDidTapOnRecipe(id:String)
}


/* interactor protocols */

protocol RecipeSearchInteractorProtocol {
    var presenter: RecipeSearchInteractorListenerProtocol?{get set}
    func loadData(search:String)
}

protocol RecipeSearchInteractorListenerProtocol {
    func onLoadDataSuccess(list:Array<Recipe>)
    func onLoadDataFailure(description:String)
}

/* presenter */

protocol RecipeSearchRouterProtocol {
    static func initModule(viewref:RecipeSearchViewProtocol)
}
