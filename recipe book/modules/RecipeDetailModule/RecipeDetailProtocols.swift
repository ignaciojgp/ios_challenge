//
//  RecipeDetailProtocols.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import Foundation
import UIKit


protocol RecipeDetailPresenterProtocol {
    
    var view:RecipeDetailViewProtocol?{get set}
    var interactor:RecipeDetailInteractorProtocol?{get set}
    var router:RecipeDetailRouterProtocol?{get set}
    
    var mealID:String? {get set}
    
    
}

/* view protocols */
protocol RecipeDetailViewProtocol {
    var presenter: RecipeDetailViewDelegate?{get set}
    
    func showData(recipe:RecipeDetail)
    func showError(message:String)
    
}

protocol RecipeDetailViewDelegate{
    func fetchData()
}


/* interactor protocols */

protocol RecipeDetailInteractorProtocol {
    var presenter: RecipeDetailInteractorListenerProtocol?{get set}
    func loadRecipe(id:String)
    
}

protocol RecipeDetailInteractorListenerProtocol {
    func onLoadDataSuccess(recipe:RecipeDetail)
    func onLoadDataFailure(description:String)
}

/* presenter */

protocol RecipeDetailRouterProtocol {
    static func initModule(viewref: UIViewController & RecipeDetailViewProtocol )
}
