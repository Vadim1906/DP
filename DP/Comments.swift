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
class Comments: UIViewController, UITableViewDataSource{
    //@IBOutlet weak var test: UILabel!
    var commentsInfo = [CommentsInfo]()
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
        
        let comments: CommentsInfo
        comments =  commentsInfo[indexPath.row]
        cell!.textLabel!.text = comments.text
       // cell!.detailTextLabel!.text = comments.name
        return cell!
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsInfo.count
    }
    func loadData(){
        let test = db.collection("comments")
        let query = test.whereField("name", isEqualTo: "qwerty@mail.com")
        print(query)
         print(query)
         print(query)
         print(query)
         print(query)
    
        db.collection("comments").getDocuments{
            (QuerySnapshot, Error) in
            if let error = Error{
                print(error)
            }else{
                self.commentsInfo = QuerySnapshot!.documents.flatMap({CommentsInfo(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
        
        
    }
    func tableView(_  tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            commentsInfo.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination  as? DetailViewController{
//            destination.recipe = recipeTest[(tableView.indexPathForSelectedRow?.row)!]
//
//
//        }
//    }
    
}
