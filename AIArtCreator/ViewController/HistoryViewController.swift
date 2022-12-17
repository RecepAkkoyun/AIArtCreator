//
//  HistoryViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 16.11.2022.
//

import UIKit

class HistoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    var collectionView : UICollectionView?
    let lblHistory = UILabel()
    let imgBack = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white

        imgBack.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBackBtn))
        imgBack.addGestureRecognizer(gestureRecognizer)
        
        
        createLblHistory()
        createImgBack()
        createCollectionView()
    }
    
    func createLblHistory() {
        lblHistory.text = "History"
        lblHistory.font = lblHistory.font.withSize(25)
        lblHistory.textAlignment = .center
        lblHistory.frame = CGRect(x: 0.3 * screenWidth, y: 0.06 * screenHeight, width: 0.4 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(lblHistory)
    }
    
    func createImgBack() {
        imgBack.image = UIImage(named: "Icon_Home4_Back")
        imgBack.frame = CGRect(x: 0.02 * screenWidth, y: 0.15 * screenWidth, width: 0.1 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(imgBack)
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: screenWidth * 0.44, height: screenHeight * 0.4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = -120
        layout.minimumInteritemSpacing = -70
        collectionView?.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
      collectionView.frame = CGRect(x: 0 * screenWidth, y: 0.13 * screenHeight, width: screenWidth, height: screenHeight)
    }
    
    @objc func didTapBackBtn() {
        let vc2 = HomeViewController()
        vc2.isHeroEnabled = true
        vc2.modalPresentationStyle = .fullScreen
        vc2.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc2, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creatorArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as! HistoryCollectionViewCell
        
        cell.prompt.text = creatorArr[indexPath.row].prompt
        cell.creatorImg.image = creatorArr[indexPath.row].resultImage
        cell.layer.cornerRadius = 12
        cell.creatorImg.layer.cornerRadius = 12
        return cell
    }
        
}
