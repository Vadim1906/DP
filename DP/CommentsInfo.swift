//
//  CommentsInfo.swift
//  DP
//
//  Created by Вадим Иванов on 14.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

//
//  RecipeTest.swift
//  DP
//
//  Created by Вадим Иванов on 04.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
protocol Documents{
    init?(dictionary: [String: Any])
}
struct CommentsInfo{
    var name: String
    var text: String
    var recipe: String
    
    var dictionary: [String: Any]{
        return[
            "name": name,
            "text": text,
            "recipe": recipe
        ]
    }
}

extension CommentsInfo: Documents{
    init?(dictionary: [String: Any]){
        guard let name = dictionary["name"] as? String,
            let text = dictionary["text"] as? String,
            let recipe = dictionary["recipe"] as? String
            else{
                return nil
        }
        self.init(name: name, text: text, recipe: recipe)
    }
}

