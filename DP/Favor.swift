//
//  Favorite.swift
//  DP
//
//  Created by Вадим Иванов on 02.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class Favor: UIViewController, UITableViewDataSource{
    @IBOutlet weak var test: UILabel!
    var recipeTest = [RecipeTest]()
    var myIndex = 0
    var db: Firestore!
    var docRef: DocumentReference!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        title = "\"The List\""
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.dataSource = self as! UITableViewDataSource
//        tableView.delegate = self
        db = Firestore.firestore()
        loadData()
        
    }
    func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        let recipeRef = db.collection("recipe")
//        recipeRef.value(forKey: "autor")
        //let test = db.
        
        let recipe_name: RecipeTest
        recipe_name =  recipeTest[indexPath.row]
        cell!.textLabel!.text = recipe_name.name
        return cell!
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeTest.count
    }
    func loadData(){
        db.collection("recipe").getDocuments{
            (QuerySnapshot, Error) in
            if let error = Error{
                print(error)
            }else{
                self.recipeTest = QuerySnapshot!.documents.flatMap({RecipeTest(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        
        }
       
        
        
    }
    func tableView(_  tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            recipeTest.remove(at: indexPath.row)
                tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination  as? DetailViewController{
            destination.recipe = recipeTest[(tableView.indexPathForSelectedRow?.row)!]
            
            
        }
    }

}

