//
//  MainView.swift
//  DP
//
//  Created by Вадим Иванов on 24.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class MainView: UIViewController {
    @IBAction func myRecipe(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil{
            let alert = UIAlertController(title: "Вы не моможете перейти во вкладку Мои Рецепты", message: "Зарегистрируйтесь", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func favorite(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil{
            let alert = UIAlertController(title: "Вы не моможете  перейти во вкладку Избранное", message: "Зарегистрируйтесь", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func acc(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil{
            let alert = UIAlertController(title: "Вы не моможете  перейти во вкладку Личный кабинет", message: "Зарегистрируйтесь", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    var name: String?

   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logOut(_ sender: Any) {
       try? Auth.auth().signOut()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination  as? Search{
            destination.mail = name
        }
    }
    
}
