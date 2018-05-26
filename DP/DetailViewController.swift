//
//  DeatilViewController.swift
//  DP
//
//  Created by Вадим Иванов on 04.05.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    @IBAction func addToFavorite(_ sender: Any) {
        
    }
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var im: UIImageView!
   
    @IBOutlet weak var recipeText: UITextView!
    var recipe: RecipeTest?
    var images: RecipeTest?
    override func viewDidLoad() {
        super.viewDidLoad()
        test.text = recipe?.name
        recipeText.text = recipe?.text
        im.image = UIImage(named: (recipe?.name)!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
