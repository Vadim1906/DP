//
//  RegistrView.swift
//  DP
//
//  Created by Вадим Иванов on 16.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class RegistrView: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
   
    override func viewDidLoad() {
        
    }
    @IBAction func registration(_ sender: Any) {
        if self.name.text?.count == 0{
            self.name.placeholder = "Имя введено некорректно"
        }
        if self.secondName.text?.count == 0{
            self.secondName.placeholder = "Фамилия введён некорректно"
        }
        if self.mail.text?.count == 0{
            self.mail.placeholder = "Почта введена некорректно"
        }
        if self.login.text?.count == 0 {
            self.login.placeholder = "Логин введён некорректно"
        }
        if self.password.text?.count == 0 {
            self.password.placeholder = "Пароль введён некорректно"
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let initialVC = sb.instantiateViewController(withIdentifier: "main")
            self.present(initialVC, animated: false, completion: nil)
            
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
