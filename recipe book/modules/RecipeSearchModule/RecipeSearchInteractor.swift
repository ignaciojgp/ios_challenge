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
            
            // urlRequest.httpMethod = "GET"
            // urlRequest.addValue("value", forHTTPHeaderField: "header name")
            // urlRequest.httpBody = "myjsonbody".data(using: .utf8)
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.presenter?.onLoadDataFailure(description: "Ocurrió un error")
                    return
                }
                //eval code
                
                if httpResponse.statusCode != 200 {
                    self.presenter?.onLoadDataFailure(description: "Ocurrió un error \(httpResponse.statusCode)")
                }
                
                
                guard let responseData = data else {
                    self.presenter?.onLoadDataFailure(description: "Respuesta vacía \(httpResponse.statusCode)")
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(RecipeResponse.self, from: responseData)
                    
                    guard let list = decodedResponse.meals else {
                        self.presenter?.onLoadDataFailure(description: "No se pudo obtener una lista")
                        return
                    }
                    
                    self.presenter?.onLoadDataSuccess(list: list)
                    
                    
                }catch{
                    self.presenter?.onLoadDataFailure(description: "Formato erroneo \(error.localizedDescription)")
                }
                
                
            }
            
            task.resume()
            
        }
    }
    
    
    
    
}
