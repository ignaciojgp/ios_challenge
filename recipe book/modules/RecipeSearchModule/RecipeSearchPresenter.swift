//
//  RecipeSearchPresenter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeSearchPresenter: NSObject, RecipeSearchPresenterProtocol , RecipeSearchInteractorListenerProtocol, RecipeSearchViewDelegate{
    
    
    var view: RecipeSearchViewProtocol?
    
    var interactor: RecipeSearchInteractorProtocol?
    
    var router: RecipeSearchRouterProtocol?
    
    //MARK: interactor delegate
    func onLoadDataSuccess(list: Array<Recipe>) {
        view?.showRecipeList(list: list)
    }
    
    func onLoadDataFailure(description: String) {
        view?.showError(message: description)
    }
    
    // MARK: view delegate
    func searchRecipe(search: String) {
        self.interactor?.loadData(search: search)
    }
    func userDidTapOnRecipe(id: String) {
        
    }
    func viewDidLoad() {
        
    }

}
