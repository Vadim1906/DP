//
//  RecipeInfo.swift
//  
//
//  Created by Вадим Иванов on 04.05.2018.
//

import Foundation
import UIKit
class RecipeInfo{
    var name: String?
    var imageName: UIImage?
    init(name: String){
        self.name = name
        imageName = UIImage(named: self.name!)!
    }
}


