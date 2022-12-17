//
//  HistoryCollectionViewCell.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 16.11.2022.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "cellid"
    
    var prompt: UILabel = {
        let prompt = UILabel()
        prompt.font = prompt.font.withSize(15)
        prompt.backgroundColor = .systemGray
        prompt.textAlignment = .center
        prompt.layer.cornerRadius = 10
        return prompt
    }()
    
    var creatorImg: UIImageView = {
        let creatorImg = UIImageView()
        creatorImg.backgroundColor = .systemOrange
        creatorImg.layer.masksToBounds = true
        creatorImg.layer.cornerRadius = CGRectGetWidth(creatorImg.frame)/14.0
        return creatorImg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        creatorImg.addSubview(prompt)
        contentView.addSubview(creatorImg)
    }
    required init(coder : NSCoder) {
        fatalError("error")
    }
    override func layoutSubviews() {
        creatorImg.frame = CGRect(x: 0, y: 5, width: contentView.frame.size.width-5, height: contentView.frame.size.height * 0.6)
        
        prompt.frame = CGRect(x: 0 * creatorImg.bounds.width, y: 0.82 * creatorImg.bounds.height  , width:contentView.frame.size.width-5 , height: 40)
       
    }
}
