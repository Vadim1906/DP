//
//  Recipe.swift
//  DP
//
//  Created by Вадим Иванов on 04.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
protocol Document{
    init?(dictionary: [String: Any])
}
struct RecipeInfo{
    var name: String
    var autor: String
    var time: String
    var complexity: String
    var kitchen: String
    var timeRation: String
    var celebration: String
    var type: String
    var text: String
    var mainIngredient: String
    var mainIngredient2: String
    var mainIngredient3: String
    var mainIngredient4: String
    var mainIngredient5: String
    var photo: String
    var dictionary: [String: Any]{
        return[
            "name": name,
            "autor": autor,
            "time": time,
            "complexity": complexity,
            "kitchen": kitchen,
            "timeRation": timeRation,
            "celebration": celebration,
            "type": type,
            "text": text,
            "mainIngredient": mainIngredient,
            "mainIngredient2": mainIngredient2,
            "mainIngredient3": mainIngredient3,
            "mainIngredient4": mainIngredient4,
            "mainIngredient5": mainIngredient5,
            "photo": photo
        ]
    }
}

extension RecipeInfo: DocumentSerializable{
    init?(dictionary: [String: Any]){
        guard let name = dictionary["name"] as? String,
            let autor = dictionary["sautor"] as? String,
            let time = dictionary["time"] as? String,
            let complexity = dictionary["complexity"] as? String,
            let kitchen = dictionary["kitchen"] as? String,
            let timeRation = dictionary["timeRation"] as? String,
            let celebration = dictionary["celebration"] as? String,
            let type = dictionary["type"] as? String,
            let text = dictionary["text"] as? String,
            let mainIngredient = dictionary["mainIngredient"] as? String,
            let mainIngredient2 = dictionary["mainIngredient2"] as? String,
            let mainIngredient3 = dictionary["mainIngredient3"] as? String,
            let mainIngredient4 = dictionary["mainIngredient4"] as? String,
            let mainIngredient5 = dictionary["mainIngredient5"] as? String
            
            else{
                return nil
        }
        self.init(name: name, autor: autor, time: time, complexity: complexity, kitchen: kitchen, timeRation: timeRation, celebration: celebration, type: type, text: text, mainIngredient: mainIngredient, mainIngredient2: mainIngredient2, mainIngredient3: mainIngredient3, mainIngredient4: mainIngredient4, mainIngredient5: mainIngredient5)
    }
}
