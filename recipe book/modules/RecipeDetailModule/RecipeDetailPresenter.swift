//
//  RecipeDetailPresenter.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeDetailPresenter: NSObject , RecipeDetailPresenterProtocol, RecipeDetailViewDelegate, RecipeDetailInteractorListenerProtocol{
    var view: RecipeDetailViewProtocol?
    
    var interactor: RecipeDetailInteractorProtocol?
    
    var router: RecipeDetailRouterProtocol?
    
    func fetchData() {
        
    }
    
    func onLoadDataSuccess(recipe: RecipeDetail) {
        
    }
    
    func onLoadDataFailure(description: String) {
        
    }
    
    
    

}
