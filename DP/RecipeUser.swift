//
//  User.swift
//  DP
//
//  Created by Вадим Иванов on 02.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}
struct RecipeUser {
    var name: String
    var secondname: String
    var mail: String
    var login: String
    var password: String
    var dictionary: [String: Any]{
        return[
            "name": name,
            "secondname": secondname,
            "mail": mail,
            "login": login,
            "password": password
        ]
    }
}

extension RecipeUser: DocumentSerializable{
    init?(dictionary: [String: Any]){
        guard let name = dictionary["name"] as? String,
        let secondname = dictionary["secondname"] as? String,
        let mail = dictionary["mail"] as? String,
        let login = dictionary["login"] as? String,
            let password = dictionary["password"] as? String
        else{
                return nil
        }
        self.init(name: name, secondname: secondname, mail: mail, login: login, password: password)
    }
}
