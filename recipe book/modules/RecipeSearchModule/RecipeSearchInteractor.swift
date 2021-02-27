//
//  RecipeSearchInteractor.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

let SEARCH_URL = "https://www.themealdb.com/api/json/v1/1/search.php?s="

class RecipeSearchInteractor: NSObject, RecipeSearchInteractorProtocol {
    
    
    
    var presenter: RecipeSearchInteractorListenerProtocol?
    
    func loadData(search: String) {
        
        DispatchQueue.global().async {
            
            let urlString = "\(SEARCH_URL)\(search)"
            
            guard let url = URL(string: urlString) else {
                //throw an error
                return
            }
            
            var urlRequest = URLRequest(url: url )
            
            
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    DispatchQueue.main.async {
                        self.presenter?.onLoadDataFailure(description: "Revisa tu conexión")
                        
                    }
                    return
                }
                //eval code
                
                if httpResponse.statusCode != 200 {
                    DispatchQueue.main.async {
                        self.presenter?.onLoadDataFailure(description: "Ocurrió un error \(httpResponse.statusCode)")
                    }
                    return
                }
                
                
                guard let responseData = data else {
                    DispatchQueue.main.async {
                        
                        self.presenter?.onLoadDataFailure(description: "Respuesta vacía \(httpResponse.statusCode)")
                    }
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    
                    print(String(data: responseData, encoding: .utf8))
                    
                    let decodedResponse = try decoder.decode(RecipeSearchResponse.self, from: responseData)
                    
                    guard let list = decodedResponse.meals else {
                        DispatchQueue.main.async {
                            
                            self.presenter?.onLoadDataFailure(description: "No se pudo obtener una lista")
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        
                        self.presenter?.onLoadDataSuccess(list: list)
                    }
                    
                }catch{
                    DispatchQueue.main.async {
                        
                        self.presenter?.onLoadDataFailure(description: "Formato erroneo \(error.localizedDescription)")
                    }
                }
                
                
            }
            
            task.resume()
            
        }
    }
    
    
    
    
    
    
    
}
