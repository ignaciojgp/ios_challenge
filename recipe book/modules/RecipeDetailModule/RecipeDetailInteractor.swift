//
//  RecipeDetailInteractor.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

let RECIPE_URL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="

class RecipeDetailInteractor: RecipeDetailInteractorProtocol {
    var presenter: RecipeDetailInteractorListenerProtocol?
    
    func loadRecipe(id:String) {
        
        DispatchQueue.global().async {
            
            
            
            guard let url = URL(string: "\(RECIPE_URL)\(id)") else {
                //throw an error
                return
            }
            
            let urlRequest = URLRequest(url: url )
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                DispatchQueue.main.async {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        self.presenter?.onLoadDataFailure(description: "Respuesta incorrecta")
                        return
                    }
                    
                    if(httpResponse.statusCode != 200){
                        self.presenter?.onLoadDataFailure(description: "Respuesta incorrecta \(httpResponse.statusCode)")
                        return
                    }
                    //eval code
                    
                    guard let responseData = data else {
                        self.presenter?.onLoadDataFailure(description: "Respuesta vacía")
                        return
                    }
                    
                    do{
                        let decoder = JSONDecoder()
                        let recipeDetailResponse = try decoder.decode(RecipeDetailResponse.self, from: responseData)
                        
                        guard let recipe = recipeDetailResponse.meals?.first else{
                            self.presenter?.onLoadDataFailure(description: "No se encontró ninguna receta en la respuesta")
                            return
                            
                        }
                        
                        

                        
                        
                        
                        
                        self.presenter?.onLoadDataSuccess(recipe: recipe)
                        
                    }catch{
                        self.presenter?.onLoadDataFailure(description: "Respuesta con formato erroneo")
                    }
                    
                }
                
                
            }
            
            task.resume()
        }
    }
    
    
}
