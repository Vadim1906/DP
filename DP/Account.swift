//
//  Account.swift
//  DP
//
//  Created by Вадим Иванов on 24.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
class Account: UIViewController {
    var newMail: UITextField?
    var newPassword: UITextField?
    var pastPassword: UITextField?
    var currentPassword: UITextField?
    @IBAction func changeMail(_ sender: Any) {
        let alert = UIAlertController(title: "Изменение почты", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: mail)
        alert.addTextField(configurationHandler: currentPassword)
        let saveAction = UIAlertAction(title: "Сохранить изменения", style: .default){ (action) in
           
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func changePassword(_ sender: Any) {
        let alert = UIAlertController(title: "Изменение пароля", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: password)
        alert.addTextField(configurationHandler: pastPassword)
        let saveAction = UIAlertAction(title: "Сохранить изменения", style: .default){ (action) in
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
    }
    func mail(textField: UITextField){
        newMail = textField
        newMail?.placeholder = "Введите новую почту"
    }
    func password(textField: UITextField){
        newPassword = textField
        newPassword?.placeholder = "Введите новый пароль"
        newPassword?.isSecureTextEntry = true
    }
    func pastPassword(textField: UITextField){
        pastPassword = textField
        pastPassword?.placeholder = "Введите старый пароль"
        pastPassword?.isSecureTextEntry = true
    }
    func currentPassword(textField: UITextField){
        currentPassword = textField
        currentPassword?.placeholder = "Введите пароль"
        currentPassword?.isSecureTextEntry = true
    }
}
