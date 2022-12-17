//
//  CategoryCollectionViewCell.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 11.11.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellid"
    
    var categoryName: UILabel = {
        let categoryName = UILabel()
        categoryName.font = UIFont.boldSystemFont(ofSize: 14)
        return categoryName
    }()
    
    var categoryImg: UIImageView = {
        let categoryImage = UIImageView()
        return categoryImage
    }()
    
    var btnUse1: UIButton = {
        let buttonUse1 = UIButton()
        buttonUse1.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        buttonUse1.layer.cornerRadius = 10
        return buttonUse1
    }()
    
    @objc func didTapButton(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        selectedCategory = categoryArr[indexPath.row]
        print(selectedCategory.categoryName)
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(btnUse1)
        contentView.addSubview(categoryName)
        contentView.addSubview(categoryImg)
    }
    required init(coder : NSCoder) {
        fatalError("error")
    }
    override func layoutSubviews() {
        btnUse1.frame = CGRect(x: 0.7 * contentView.frame.size.width, y: 0.29 * contentView.frame.size.height, width: contentView.frame.size.width * 0.25, height: contentView.frame.size.height * 0.35)
        categoryImg.frame = CGRect(x: 25, y: 5, width: 70, height: 70)
        categoryName.frame = CGRect(x: 110, y: 25, width: contentView.frame.size.width-280, height: contentView.frame.size.height * 0.3)
    }
    
    
    
    
    
    
}
