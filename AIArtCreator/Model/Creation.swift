//
//  Creation.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 15.11.2022.
//

import Foundation
import UIKit

class Creation {
    var resultImage: UIImage?
    var prompt = String()
    var id = UUID().uuidString
    var style = Category()
    
    
    init(resultImage: UIImage? = nil, prompt: String = String(), style: Category = Category()) {
        self.resultImage = resultImage
        self.prompt = prompt
        self.style = style
    }
}

var creatorArr = [Creation]()

