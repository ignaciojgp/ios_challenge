//
//  RecipeDetailViewController.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeDetailViewController: UIViewController, RecipeDetailViewProtocol {
    
    
    var presenter: RecipeDetailViewDelegate?
    var ingredientList = Array<String>()

    @IBOutlet weak var iamge: UIImageView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var ingredients: UITableView!
    
    var recipe:RecipeDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecipeDetailRouter.initModule(viewref: self)

        presenter?.fetchData()
    }

    func showData(recipe: RecipeDetail) {
        
        self.recipe = recipe
        if let imageURL = recipe.strMealThumb{
            let _ =  ImageLoader.intance.imageLoader(urlString: imageURL, placeHolder: self.iamge)
        }
        
        instructions.text = recipe.strInstructions
        
        self.navigationItem.title = recipe.strMeal
    }
    
    func showError(message: String) {
        
    }
    @IBAction func onplay(_ sender: Any) {
        
        guard let url = URL(string: self.recipe!.strYoutube!) else{
            return
        }
        
        UIApplication.shared.open(url, options: [:],
                                  completionHandler: {
                                    (success) in
                                  })
    }
    
    func createIngredientList(recipe:RecipeDetail){
        
        ingredientList.removeAll()
        
        addIngredient(val: recipe.strIngredient1)
        addIngredient(val: recipe.strIngredient2)
        addIngredient(val: recipe.strIngredient3)
        addIngredient(val: recipe.strIngredient4)
        addIngredient(val: recipe.strIngredient5)
        addIngredient(val: recipe.strIngredient6)
        addIngredient(val: recipe.strIngredient7)
        addIngredient(val: recipe.strIngredient8)
        addIngredient(val: recipe.strIngredient9)
        addIngredient(val: recipe.strIngredient10)
        addIngredient(val: recipe.strIngredient11)
        addIngredient(val: recipe.strIngredient12)
        addIngredient(val: recipe.strIngredient13)
        addIngredient(val: recipe.strIngredient14)
        addIngredient(val: recipe.strIngredient15)
        addIngredient(val: recipe.strIngredient16)
        addIngredient(val: recipe.strIngredient17)
        addIngredient(val: recipe.strIngredient18)
        addIngredient(val: recipe.strIngredient19)
        addIngredient(val: recipe.strIngredient20)
        
        
    }
    
    func addIngredient(val:String?){
        if val != nil && !val!.elementsEqual("") {
            ingredientList.append(val!)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
