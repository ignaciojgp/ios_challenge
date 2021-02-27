//
//  RecipeDetailViewController.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeDetailViewController: UIViewController, RecipeDetailViewProtocol {
    
    
    var presenter: RecipeDetailViewDelegate?
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
