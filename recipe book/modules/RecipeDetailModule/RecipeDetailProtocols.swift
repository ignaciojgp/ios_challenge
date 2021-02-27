//
//  RecipeDetailProtocols.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import Foundation


protocol RecipeDetailPresenterProtocol {
    
    var view:RecipeDetailViewProtocol?{get set}
    var interactor:RecipeDetailInteractorProtocol?{get set}
    var router:RecipeDetailRouterProtocol?{get set}
    
    
}

/* view protocols */
protocol RecipeDetailViewProtocol {
    var presenter: RecipeDetailViewDelegate?{get set}
    
    //add showData function
    //add showError function
    
}

protocol RecipeDetailViewDelegate{
    func fetchData()
    //add onUserDoSomething
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
    static func initModule(viewref:RecipeDetailViewProtocol)
}
