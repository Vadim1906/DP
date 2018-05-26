//
//  RecipeTest.swift
//  DP
//
//  Created by Вадим Иванов on 04.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
protocol Document{
    init?(dictionary: [String: Any])
}
struct RecipeTest{
    var name: String
    var text: String
    var image: String
    var type: String
    var complexity: String
    var kitchen: String
    var celebration: String
    var autor: String
    
    var dictionary: [String: Any]{
        return[
            "name": name,
            "text": text,
            "image": image,
            "type": type,
            "complexity": complexity,
            "kitchen": kitchen,
            "celebration": celebration,
            "autor": autor
        ]
    }
}

extension RecipeTest: Document{
    init?(dictionary: [String: Any]){
        guard let name = dictionary["name"] as? String,
            let text = dictionary["text"] as? String,
            let image = dictionary["image"] as? String,
            let type = dictionary["type"] as? String,
            let complexity = dictionary["complexity"] as? String,
            let kitchen = dictionary["kitchen"] as? String,
            let celebration = dictionary["celebration"] as? String,
            let autor = dictionary["autor"] as? String
            else{
                return nil
        }
        self.init(name: name, text: text, image: image, type: type, complexity: complexity, kitchen: kitchen, celebration: celebration, autor: autor)
    }
}
