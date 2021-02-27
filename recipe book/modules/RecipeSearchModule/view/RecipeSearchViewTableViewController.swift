//
//  RecipeSearchViewTableViewController.swift
//  recipe book
//
//  Created by Ignacio J Gonzalez Pérez on 27/02/21.
//

import UIKit

class RecipeSearchViewTableViewController: UITableViewController,  RecipeSearchViewProtocol{
    var presenter: RecipeSearchViewDelegate?
   
    var list:Array<Recipe>?
    
    var tasksmap = Dictionary<UITableViewCell, URLSessionTask> ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RecipeSearchRouter.initModule(viewref: self)
        
    }
    
    
   

    // MARK: - RecipeSearchViewProtocol

    
    func showRecipeList(list: Array<Recipe>) {
        self.list = list
        self.tableView.reloadData()
    }
    
    func showBannerWith(recipe: Recipe) {
        
    }
    
    func showError(message: String) {
        
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultcell")!
        
        if let currentTask = tasksmap[cell] {
            currentTask.cancel()
        }
        
        cell.imageView?.image = UIImage(named: "thumb")
        cell.textLabel?.text = self.list?[indexPath.row].strMeal
        cell.detailTextLabel?.text = self.list?[indexPath.row].strCategory
       
        if let thumbPath =  self.list?[indexPath.row].strMealThumb {
            
            tasksmap[cell] = ImageLoader.intance.imageLoader(urlString: thumbPath, placeHolder: cell.imageView!)
        }

        return cell
    }

    
    
    @IBAction func onSearchChange(_ sender: UITextField) {
        print("searchString : \(sender.text)")
        self.presenter?.searchRecipe(search: sender.text ?? "")
    }
    
}
