//
//  RecipeDetailPresenter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeDetailPresenter: NSObject , RecipeDetailPresenterProtocol, RecipeDetailViewDelegate, RecipeDetailInteractorListenerProtocol{
    var mealID: String?
    
    var view: RecipeDetailViewProtocol?
    
    var interactor: RecipeDetailInteractorProtocol?
    
    var router: RecipeDetailRouterProtocol?
    
    func fetchData() {
        
        guard let id = mealID else {
            return
        }
        interactor?.loadRecipe(id: id)
        
    }
    
    func onLoadDataSuccess(recipe: RecipeDetail) {
        view?.showData(recipe: recipe)
    }
    
    func onLoadDataFailure(description: String) {
        view?.showError(message: description)
    }
    
    
    

}
