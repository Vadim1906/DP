//
//  Search.swift
//  DP
//
//  Created by Вадим Иванов on 30.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Firebase
import FirebaseAuth
import FirebaseDatabase

class Search: UIViewController, UITableViewDataSource{
   var db: Firestore!
   var users = [RecipeUser]()
   var mail: String?
   var user_name: String?
   @IBOutlet weak var tableView: UITableView!
   var recipeName: UITextField?
   var recipeType: UITextField?
   var recipeTime: UITextField?
   var recipeKitchen: UITextField?
   var recipeComplexity: UITextField?
   var recipeRation: UITextField?
   var recipeCelebration: UITextField?
   var recipeText: UITextField?
   var names = [String]()
   var recipeTest = [RecipeTest]()
   var filterRecipe = [RecipeTest]()
   var myIndex = 0
   var ref: DatabaseReference?
   let searchController = UISearchController(searchResultsController: nil)
   var typeSearch: String?
   var filteredArray = [String]()
    
    //var recipe = [Recipe]()
    @IBAction func chooseSearch(_ sender: UIButton) {
        chooseSearchItems.forEach({(button) in
            button.isHidden = !button.isHidden
        })
        self.tableView.reloadData()
    }
 
    @IBOutlet weak var chooseSearchOutlet: UIButton!
    @IBOutlet var chooseSearchItems: [UIButton]!
    @IBAction func chooseSearchItemsOutlet(_ sender: UIButton) {
        self.typeSearch = sender.titleLabel?.text
        
        if typeSearch == "По типу блюда"{
            searchController.searchBar.scopeButtonTitles = ["Все", "Жаренное", "Вареное", "Тушеное", "Копченое"]
           // searchController.searchBar.showsScopeBar = false
            
        }
        if typeSearch == "По сложности"{
            searchController.searchBar.scopeButtonTitles = ["Все", "Легко", "Средне", "Сложно"]
        }
        if typeSearch == "По типу кухни"{
           searchController.searchBar.scopeButtonTitles = ["Все", "Европейская", "Восточная", "Другая"]
        }
        if typeSearch == "По типу праздника"{
            searchController.searchBar.scopeButtonTitles = ["Все", "Любой", "Рождество", "Новый Год"]
        }
        
        
        self.tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
       // typeSearch = "complexity"
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        db = Firestore.firestore()
        
        loadData()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["Все", "Жареное", "Вареное", "Тушеное"]
        ref = Database.database().reference()
    }
    override func viewDidLayoutSubviews() {
        self.searchController.searchBar.sizeToFit()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filterRecipe.count
        }
        return recipeTest.count
    }
    
    @IBAction func add(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid
//        let test = db.collection("recipe").document("plov")
//        test.getDocument{ (document, error) in
//            if let testrecipe = document.flatMap({
//                $0.data().flatMap({ (data) in
//                    return RecipeTest(dictionary: data)
//                })
//            }){
//                print("Recipe: \(testrecipe)")
//            }else{
//                print("11111")
//            }
//        }
        db.collection("recipe").whereField("name", isEqualTo: "Плов с курицей").getDocuments(){
            (QuerySnapshot, err) in
            if let err = err{
                print(11111)
            } else{
                for document in QuerySnapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        //let query = test.whereField("kitchen", isEqualTo: "Восточная")
       // print(query)
     //   print(query)
     //   print(query)
//        print(uid)
//        print(uid)
//        print(uid)
//        print(uid)
//        print(uid)
//        print(uid)
       // if uid == "Xs23vCUpLATSPuUELrmctAEgMql1"{
        if uid != nil{
        
            let alert = UIAlertController(title: "Новый рецепт", message: "Заполните все поля", preferredStyle: .alert)
            alert.addTextField(configurationHandler: recipeName)
            alert.addTextField(configurationHandler: recipeType)
            alert.addTextField(configurationHandler: recipeTime)
            alert.addTextField(configurationHandler: recipeKitchen)
            alert.addTextField(configurationHandler: recipeComplexity)
            alert.addTextField(configurationHandler: recipeRation)
            alert.addTextField(configurationHandler: recipeCelebration)
            alert.addTextField(configurationHandler: recipeText)
//            let recipeRef = db.collection("recipe").whereField("type", isEqualTo: "Жаренное")
//                .addSnapshotListener{ querySnapshot, error in
//                    guard let docum
//
//            }
           // recipeRef.
//            recipeRef.document("recipe").setData([
//                "name": "www",
//                "text": "dddddd",
//                "image": "dddd",
//                "type": "ddcx"
//
//                ])
//             print(recipeRef.document("recipe").value(forKey: "name"))
//             print(recipeRef.document("recipe").value(forKey: "name"))
//             print(recipeRef.document("recipe").value(forKey: "name"))
//             print(recipeRef.document("recipe").value(forKey: "name"))
            //print(recipeRef.document("recipe").)
            //let test = self.db.collection("recipe").whereField("name", isEqualTo: "Яичница по-французски")
           
            let saveAction = UIAlertAction(title: "Сохранить", style: .default){ (action) in
                let textField = alert.textFields?.first
                self.names.append(textField!.text!)
                 if let name = alert.textFields?[0].text, let type = alert.textFields?[1].text , let time = alert.textFields?[2].text, let kitchen = alert.textFields?[3].text, let complexity = alert.textFields?[4].text, let racion = alert.textFields?[5].text, let celebration = alert.textFields?[6].text, let text = alert.textFields?[7].text {
                //self.saveNmae(name: textField!.text!)
                   
                    let docRef = self.db.collection("recipe").addDocument(data: [
                        "name": name,
                        "text": text,
                        "image": name,
                        "type": type,
                        "time": time,
                        "kitchen": kitchen,
                        "complexity": complexity,
                        "racion": racion,
                        "celebration": celebration,
                        "autor": Auth.auth().currentUser?.uid
                    ]){err in
                        if let err = err{
                            print(err)
                        }else{
                            print(123)
                        }
                    }
                    docRef.getDocument{(document, error) in
                        if let recipes = document.flatMap({
                            $0.data().flatMap({(data) in
                                return RecipeTest(dictionary: data)
                            })
                        }){
                            print("recipe: \(recipes)")
                        }else{
                            print(error)
                        }
                    }
                   
                }
                 self.tableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            //alert.addTextField(configurationHandler: nil)
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
            self.tableView.reloadData()
     
        }else{
            let alert = UIAlertController(title: "Вы не моможете добавлять новые поля", message: "Зарегистрируйтесь", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
       
        
//        print(test)
//        
//        print(test.whereField("name", isEqualTo: "Плов с курицей" ))
//      
        
         self.tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let recipe_name: RecipeTest
        if isFiltering(){
            recipe_name = filterRecipe[indexPath.row]
        }else{
            recipe_name =  recipeTest[indexPath.row]
        }
        
        
        cell!.textLabel!.text = recipe_name.name
        cell!.detailTextLabel?.text = recipe_name.type
        if self.typeSearch == "По типу блюда"{
            cell!.detailTextLabel?.text = recipe_name.type
        }
        if self.typeSearch == "По сложности"{
            cell!.detailTextLabel?.text = recipe_name.complexity
        }
        if self.typeSearch == "По типу кухни"{
            cell!.detailTextLabel?.text = recipe_name.kitchen
        }
        if self.typeSearch == "По типу праздника"{
            cell!.detailTextLabel?.text = recipe_name.celebration
        }
       // cell!.textLabel!.text = recipe_name.value(forKey: "recipe_name") as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    
//
    func tableView(_  tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        let uid = Auth.auth().currentUser?.uid
        
        if uid == "Xs23vCUpLATSPuUELrmctAEgMql1"{
            if editingStyle == .delete{
                recipeTest.remove(at: indexPath.row)
                tableView.reloadData()
            }
       }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func recipeName(textField: UITextField!){
        recipeName = textField
        recipeName?.placeholder = "Введите название блюда(Плов)"
    }
    func recipeType(textField: UITextField!){
        recipeType = textField
        recipeType?.placeholder = "Введите тип блюда(Жаренное)"
    }
    func recipeTime(textField: UITextField){
        recipeTime = textField
        recipeTime?.placeholder = "Введите время приготовления в мин(10)"
    }
    func recipeKitchen(textField: UITextField){
        recipeKitchen = textField
        recipeKitchen?.placeholder = "Введите тип  кухни(Русская)"
    }
    func recipeComplexity(textField: UITextField){
        recipeComplexity = textField
        recipeComplexity?.placeholder = "Введите сложность приготовления(Легко)"
    }
    func recipeRation(textField: UITextField){
        recipeRation = textField
        recipeRation?.placeholder = "Введите время рациона(Завтрак)"
    }
    func recipeCelebration(textField: UITextField){
        recipeCelebration = textField
        recipeCelebration?.placeholder = "Введите тип праздника(Рождество)"
    }
    func recipeText(textField: UITextField){
        recipeText = textField
        recipeText?.placeholder = "Введите текст рецепта"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        performSegue(withIdentifier: "detail", sender: self)
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination  as? DetailViewController{
            destination.recipe = recipeTest[(tableView.indexPathForSelectedRow?.row)!]
            
            
        }
    }
    func searchBarIsEmpty()->Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func filterContentForSearchText(_ searchText: String, scope: String = "Все"){
        filterRecipe = recipeTest.filter({(recipe: RecipeTest) -> Bool in
            var doesCategoryMatch = (scope == "Все") || (recipe.type == scope)
            if self.typeSearch == "По типу блюда"{
                doesCategoryMatch = (scope == "Все") || (recipe.type == scope)
            }
            if self.typeSearch == "По сложности"{
                doesCategoryMatch = (scope == "Все") || (recipe.complexity == scope)
            }
            if self.typeSearch == "По типу кухни"{
                doesCategoryMatch = (scope == "Все") || (recipe.kitchen == scope)
            }
            if self.typeSearch == "По типу праздника"{
                doesCategoryMatch = (scope == "Все") || (recipe.celebration == scope)
            }
            if searchBarIsEmpty(){
                return doesCategoryMatch
            }else{
                return doesCategoryMatch && recipe.name.lowercased().contains(searchText.lowercased())
            }
            
            
        })
        tableView.reloadData()
    }
    func isFiltering() -> Bool{
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}
extension Search: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
extension Search: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

