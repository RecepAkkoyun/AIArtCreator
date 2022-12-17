//
//  ViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 10.11.2022.
//

import UIKit
import Hero

class ViewController: UIViewController {
    
    let lblWelcome = UILabel()
    let lblArtCreator = UILabel()
    let downText = UILabel()
    let btnContinue = UIButton()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDefaultSize(view: view)
        // Do any additional setup after loading the view.
        
        createLblWelcome()
        createLblArtCreator()
        createDownText()
        createbtnContinue()
        createImageView()
    }

    func createLblWelcome() {
        lblWelcome.text = "Welcome to"
        lblWelcome.textColor = .black
        lblWelcome.textAlignment = .center
        lblWelcome.font = UIFont.boldSystemFont(ofSize: 30)
        lblWelcome.frame = CGRect(x: 0.2 * screenWidth, y: 0.5 * screenHeight, width: 0.6 * screenWidth, height: 0.1 * screenHeight)
        
        view.addSubview(lblWelcome)
    }
    
    func createLblArtCreator() {
        lblArtCreator.text = "AI Art Creator"
        lblArtCreator.textColor = .black
        lblArtCreator.textAlignment = .center
        lblArtCreator.font = lblArtCreator.font.withSize(30)
        lblArtCreator.frame = CGRect(x: 0.2 * screenWidth, y: 0.57 * screenHeight, width: 0.6 * screenWidth, height: 0.1 * screenHeight)
        
        view.addSubview(lblArtCreator)
    }
    
    func createDownText() {
        downText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        downText.textAlignment = .center
        downText.textColor = .black
        downText.numberOfLines = 0
        downText.font = downText.font.withSize(15)
        downText.frame = CGRect(x: 0.1 * screenWidth, y: 0.7 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        
        view.addSubview(downText)
    }
    
    func createbtnContinue() {
        btnContinue.setTitle("Continue", for: .normal)
        btnContinue.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
        btnContinue.setTitleColor(.black, for: .normal)
        btnContinue.layer.cornerRadius = 10
        btnContinue.frame = CGRect(x: 0.2 * screenWidth, y: 0.88 * screenHeight, width: 0.6 * screenWidth, height: 0.06 * screenHeight)
        btnContinue.addTarget(self, action: #selector(toInAppPage), for: .touchUpInside)
        
        view.addSubview(btnContinue)
    }
    
    func createImageView() {
        imageView.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: screenWidth, height: 0.4 * screenHeight)
        imageView.image = UIImage(named: "Img_Onboarding")
        
        view.addSubview(imageView)
    }
    
    @objc func toInAppPage() {
        let inAppVc = InAppViewController()
        inAppVc.isHeroEnabled = true
        inAppVc.modalPresentationStyle = .fullScreen
        inAppVc.hero.modalAnimationType = .pageIn(direction: .left)
        present(inAppVc, animated: true)
    }

}
