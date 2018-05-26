//
//  ViewController.swift
//  DP
//
//  Created by Вадим Иванов on 14.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
class ViewController: UIViewController {
    var db: Firestore!
    var users = [RecipeUser]()
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    var registrName: UITextField?
    var registrSecondName: UITextField?
    var registrMail: UITextField?
    var registrLogin: UITextField?
    var registrPassword: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        password.isSecureTextEntry = true
       // loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
//    func loadData(){
//        db.collection("user").getDocuments{
//            (QuerySnapshot, Error) in
//            if let error = Error{
//                print(error)
//            }else{
//                self.users = QuerySnapshot!.documents.flatMap({RecipeUser(dictionary: $0.data())})
//            }
//        }
//    }

    @IBAction func autorisation(_ sender: Any) {
        if self.login.text?.count == 0 {
            self.login.placeholder = "Логин введён некорректно"
        }
        if self.password.text?.count == 0 {
            self.password.placeholder = "Пароль введён некорректно"
            let alert = UIAlertController(title: "Данные введены некорректно", message: "", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        if let mail = self.login.text, let password = self.password.text{
            Auth.auth().signIn(withEmail: mail, password: password, completion: {(user, Error) in
                if let error = Error{
                    print(error)
                    return
                }
                else{
                    
//                    let sb = UIStoryboard(name: "Main", bundle: nil)
//                    let initialVC = sb.instantiateViewController(withIdentifier: "main")
//                    self.present(initialVC, animated: false, completion: nil)
                }
            })
        }
//        else{
//
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let initialVC = sb.instantiateViewController(withIdentifier: "main")
//            self.present(initialVC, animated: false, completion: nil)
//        }
        
        
    }
    @IBAction func registration(_ sender: Any) {
        let alert = UIAlertController(title: "Регистрация", message: "Заполните все поля", preferredStyle: .alert)
        alert.addTextField(configurationHandler: registrName)
        alert.addTextField(configurationHandler: registrSecondName)
        alert.addTextField(configurationHandler: registrMail)
        alert.addTextField(configurationHandler: registrLogin)
        alert.addTextField(configurationHandler: registrPassword)
        let saveAction = UIAlertAction(title: "Зарегистрироваться", style: .default){ (action) in
            
                if let name = alert.textFields?[0].text, let secondName = alert.textFields?[1].text, let mail = alert.textFields?[2].text, let login = alert.textFields?[3].text, let password = alert.textFields?[4].text {
                    let recipeUsers = RecipeUser(name: name, secondname: secondName, mail: mail, login: login, password: password)
//                    var ref : DocumentReference? = nil
//                    ref = self.db.collection("users").addDocument(data: recipeUsers.dictionary, completion: {
//                        (Error) in
//                        if let error = Error{
//                            print(error)
//                        }else{
                            Auth.auth().createUser(withEmail: mail, password: password, completion: {user, Error in
                                if let error = Error{
                                    print(error)
                                    print(123)
                                    print(123)
                                    print(123)
                                    print(123)
                                    print(123)
                                    print(123)
                                    return
                                }
                                guard let uid = user?.uid else{
                                    return
                                }
                                let ref = Database.database().reference()
                                let userReference = ref.child("users").child(uid)
                                let values = ["name": name, "email": mail]
                                userReference.updateChildValues(values, withCompletionBlock: {(error, ref) in
                                    if error != nil {
                                        print(error)
                                    }
                                })
                              //  print("111")
                            })
                          //  print(ref!.documentID)
                      //  }
                  //  })
                  
            
                }
                self.present(alert, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func skip(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = sb.instantiateViewController(withIdentifier: "guest")
        self.present(initialVC, animated: false, completion: nil)
    }
    func registrName(textField: UITextField!){
       registrName = textField
       registrName?.placeholder = "Введите ваше имя(Иван)"
    }
    func registrSecondName(textField: UITextField!){
        registrSecondName = textField
        registrSecondName?.placeholder = "Введите вашу фамилию(Петров)"
    }
    func registrMail(textField: UITextField){
        registrMail = textField
        registrMail?.placeholder = "Введите вашу почту(ivan1@mail.ru)"
    }
    func registrLogin(textField: UITextField){
        registrLogin = textField
        registrLogin?.placeholder = "Введите ваш логин(ivan123)"
    }
    func registrPassword(textField: UITextField){
        registrPassword = textField
        registrPassword?.placeholder = "Введите ваш пароль(123)"
        registrPassword?.isSecureTextEntry = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination = segue.destination  as? MainView{
          destination.name = login.text
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

