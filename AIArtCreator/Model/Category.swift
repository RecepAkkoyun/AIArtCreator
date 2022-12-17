//
//  Category.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 11.11.2022.
//

import UIKit

class Category {
    
    var categoryName = String()
    var categoryImg = UIImage()
    
    init(categoryName: String = String(), categoryImg: UIImage = UIImage()) {
        self.categoryName = categoryName
        self.categoryImg = categoryImg
    }
}

var selectedCategory = Category()
var categoryArr = [Category]()

func createCategory() {
    categoryArr.append(Category(categoryName: "Surrealist", categoryImg: UIImage(named: "Img_Home_Surrealist")!))
    categoryArr.append(Category(categoryName: "Steampunk", categoryImg: UIImage(named: "Img_Home_Steampunk")!))
    categoryArr.append(Category(categoryName: "Rick and Morty", categoryImg: UIImage(named: "Img_Home_Rick and Morty")!))
    categoryArr.append(Category(categoryName: "Renaissance Painting", categoryImg: UIImage(named: "Img_Home_Renaissance Painting")!))
    categoryArr.append(Category(categoryName: "Portrait Photo", categoryImg: UIImage(named: "Img_Home_Portrait Photo")!))
    
}
