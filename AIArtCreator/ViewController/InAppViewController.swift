//
//  InAppViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 10.11.2022.
//

import UIKit
import Hero

class InAppViewController: UIViewController {
    
    var myColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
    
    let imageView = UIImageView()
    let imageViewbtnCross = UIImageView()
    let subtitleImage1 = UIImageView()
    let subtitleImage2 = UIImageView()
    let subtitleImage3 = UIImageView()
    var isSenderSettings = false
    
    let lblExplorePremium = UILabel()
    let lblUnleash = UILabel()
    let subtitleText1 = UILabel()
    let subtitleText2 = UILabel()
    let subtitleText3 = UILabel()
    
    let lblDays = UILabel()
    let lblWeeklyPlan = UILabel()
    let lblWeeklyPrice = UILabel()
    let lblYearlyPlan = UILabel()
    let lblYearlyPrice = UILabel()
    
    
    let btnWeeklyPlan = UIButton()
    let btnYearlyPlan = UIButton()
    let btnStart = UIButton()
    let btnLink1 = UIButton()
    let btnLink2 = UIButton()
    let btnLink3 = UIButton()
    
    
    override func viewDidLoad() {
        setDefaultSize(view: view)
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        createImageView()
        createImageViewBtnCross()
        CreategestureRecognizer()
        
        createLblExplorePremium()
        createLblUnleash()
        createSuTitleText1()
        createSuTitleText2()
        createSuTitleText3()
        
        createbtnWeekly()
        createbtnYearly()
        createBtnStart()
        
        createBtnLink1()
        createBtnLink2()
        createBtnLink3()
    }
    
    func createImageView() {
        imageView.image = UIImage(named: "Img_Inapp")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
    func createImageViewBtnCross() {
        imageViewbtnCross.image = UIImage(named: "btn_cross")
        imageViewbtnCross.frame = CGRect(x: 0.85 * screenWidth, y: 0.05 * screenHeight, width: 0.1 * screenWidth, height: 0.05 * screenHeight)
        
        view.addSubview(imageViewbtnCross)
    }
    
    func CreategestureRecognizer() {
        imageViewbtnCross.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCross))
        imageViewbtnCross.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func didTapCross() {
        if isSenderSettings != true {
            let vc2 = HomeViewController()
            vc2.isHeroEnabled = true
            vc2.modalPresentationStyle = .fullScreen
            vc2.hero.modalAnimationType = .pageOut(direction: .right)
            present(vc2, animated: true)
        } else{
            dismiss(animated: true)
        }
    }
    
    func createLblExplorePremium() {
        lblExplorePremium.text = "Explore PREMIUM"
        lblExplorePremium.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lblExplorePremium.textAlignment = .center
        lblExplorePremium.font = UIFont.boldSystemFont(ofSize: 30)
        lblExplorePremium.frame = CGRect(x: 0.1 * screenWidth, y: 0.37 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        
        view.addSubview(lblExplorePremium)
    }
    func createLblUnleash() {
        lblUnleash.text = "Unleash your creativity with PRO experience"
        lblUnleash.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        lblUnleash.textAlignment = .center
        lblUnleash.font = lblUnleash.font.withSize(15)
        lblUnleash.frame = CGRect(x: 0.1 * screenWidth, y: 0.43 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        
        view.addSubview(lblUnleash)
    }
    
    func createSuTitleText1() {
        subtitleText1.text = "Fast proccessing"
        subtitleText1.font = subtitleText1.font.withSize(17)
        subtitleText1.frame = CGRect(x: 0.3 * screenWidth, y: 0.48 * screenHeight, width: 0.6 * screenWidth, height: 0.1 * screenHeight)
        
        subtitleImage1.image = UIImage(named: "Icon_Inapp")

        
        subtitleImage1.frame = CGRect(x: 0.22 * screenWidth, y: 0.515 * screenHeight, width: 0.061 * screenWidth, height: 0.03 * screenHeight)
        
        
        view.addSubview(subtitleImage1)
        view.addSubview(subtitleText1)
    }
    
    func createSuTitleText2() {
        subtitleText2.text = "Un limited artwork creation"
        subtitleText2.font = subtitleText2.font.withSize(17)
        subtitleText2.frame = CGRect(x: 0.3 * screenWidth, y: 0.53 * screenHeight, width: 1 * screenWidth, height: 0.1 * screenHeight)
        
        subtitleImage2.image = UIImage(named: "Icon_Inapp")

        
        subtitleImage2.frame = CGRect(x: 0.22 * screenWidth, y: 0.565 * screenHeight, width: 0.061 * screenWidth, height: 0.03 * screenHeight)
        
        
        view.addSubview(subtitleImage2)
        view.addSubview(subtitleText2)
    }
    
    func createSuTitleText3() {
        subtitleText3.text = "Get multiple results"
        subtitleText3.font = subtitleText3.font.withSize(17)
        subtitleText3.frame = CGRect(x: 0.3 * screenWidth, y: 0.58 * screenHeight, width: 1 * screenWidth, height: 0.1 * screenHeight)
        
        subtitleImage3.image = UIImage(named: "Icon_Inapp")

        
        subtitleImage3.frame = CGRect(x: 0.22 * screenWidth, y: 0.615 * screenHeight, width: 0.061 * screenWidth, height: 0.03 * screenHeight)
        
        
        view.addSubview(subtitleImage3)
        view.addSubview(subtitleText3)
    }
    
    func createbtnWeekly() {
        
        btnWeeklyPlan.setTitleColor(.black, for: .normal)
        btnWeeklyPlan.layer.cornerRadius = 10
        btnWeeklyPlan.layer.borderColor = myColor.cgColor
        btnWeeklyPlan.layer.borderWidth = 2
        btnWeeklyPlan.addTarget(self, action: #selector(didTapBtnWeekly), for: .touchUpInside)
        btnWeeklyPlan.frame = CGRect(x: 0.07 * screenWidth, y: 0.665 * screenHeight, width: 0.86 * screenWidth, height: 0.074 * screenHeight)
        
        
        lblDays.text = "3 Days Free Trial"
        lblDays.frame = CGRect(x: 0.05 * btnWeeklyPlan.bounds.width,y: 0.05 * btnWeeklyPlan.bounds.height, width: 0.4 * btnWeeklyPlan.bounds.width,height: 0.5 * btnWeeklyPlan.bounds.height)
        
        lblDays.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        lblDays.font = lblDays.font.withSize(15)
        
        lblWeeklyPlan.text = "Weekly Plan"
        lblWeeklyPlan.frame = CGRect(x: 0.05 * btnWeeklyPlan.bounds.width,y: 0.34 * btnWeeklyPlan.bounds.height, width: 0.4 * btnWeeklyPlan.bounds.width,height: 0.045 * screenHeight)
        lblWeeklyPlan.textColor = .black
        lblWeeklyPlan.font = lblWeeklyPlan.font.withSize(15)
        
        lblWeeklyPrice.text = "$3.99 "
        lblWeeklyPrice.frame = CGRect(x: 0.83 * btnWeeklyPlan.bounds.width,y: 0.22 * btnWeeklyPlan.bounds.height, width: 0.4 * btnWeeklyPlan.bounds.width,height: 0.5 * btnWeeklyPlan.bounds.height)
        lblWeeklyPrice.textColor = .black
        lblWeeklyPrice.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        
        btnWeeklyPlan.addSubview(lblWeeklyPlan)
        btnWeeklyPlan.addSubview(lblDays)
        btnWeeklyPlan.addSubview(lblWeeklyPrice)
        view.addSubview(btnWeeklyPlan)
    }
    
    func createbtnYearly() {
        
        btnYearlyPlan.setTitleColor(.black, for: .normal)
        btnYearlyPlan.layer.cornerRadius = 10
        btnYearlyPlan.layer.borderColor = myColor.cgColor
        btnYearlyPlan.layer.borderWidth = 2
        btnYearlyPlan.addTarget(self, action: #selector(didTapBtnYearly), for: .touchUpInside)
        btnYearlyPlan.frame = CGRect(x: 0.07 * screenWidth, y: 0.76 * screenHeight, width: 0.86 * screenWidth, height: 0.074 * screenHeight)
        
        
        lblYearlyPlan.text = "Yearly Plan"
        lblYearlyPlan.frame = CGRect(x: 0.05 * btnYearlyPlan.bounds.width,y: 0.3 * btnYearlyPlan.bounds.height, width: 0.4 * btnYearlyPlan.bounds.width,height: 0.5 * btnYearlyPlan.bounds.height)
        lblYearlyPlan.textColor = .black
        lblYearlyPlan.font = lblYearlyPlan.font.withSize(15)
        
        lblYearlyPrice.text = "$29.99"
        lblYearlyPrice.frame = CGRect(x: 0.8 * btnYearlyPlan.bounds.width,y: 0.3 * btnYearlyPlan.bounds.height, width: 0.37 * btnYearlyPlan.bounds.width,height: 0.3 * btnYearlyPlan.bounds.height)
        lblYearlyPrice.textColor = .black
        lblYearlyPrice.font = UIFont.boldSystemFont(ofSize: 15)
        
        btnYearlyPlan.addSubview(lblYearlyPlan)
        btnYearlyPlan.addSubview(lblYearlyPrice)
        view.addSubview(btnYearlyPlan)
    }
    
    @objc func didTapBtnYearly() {
        
        btnYearlyPlan.layer.borderColor = UIColor.black.cgColor
        btnYearlyPlan.layer.borderWidth = 3
        
        btnWeeklyPlan.layer.borderColor = myColor.cgColor
        btnWeeklyPlan.layer.borderWidth = 2
    }
    
    @objc func didTapBtnWeekly() {
        
        btnWeeklyPlan.layer.borderColor = UIColor.black.cgColor
        btnWeeklyPlan.layer.borderWidth = 3
        
        btnYearlyPlan.layer.borderColor = myColor.cgColor
        btnYearlyPlan.layer.borderWidth = 2
    }
    
    func createBtnStart() {
        
        btnStart.setTitle("Start", for: .normal)
        btnStart.backgroundColor = .black
        btnStart.setTitleColor(.white, for: .normal)
        btnStart.layer.cornerRadius = 10
        btnStart.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        btnStart.frame = CGRect(x: 0.15 * screenWidth, y: 0.87 * screenHeight, width: 0.7 * screenWidth, height: 0.06 * screenHeight)
        
        view.addSubview(btnStart)

    }
    
    @objc func didTapStartButton() {
        
        let homeVC = HomeViewController()
        homeVC.isHeroEnabled = true
        homeVC.modalPresentationStyle = .fullScreen
        homeVC.hero.modalAnimationType = .pageIn(direction: .left)
        present(homeVC, animated: true)
    }
    
    func createBtnLink1() {

        var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13.0),
        NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00),
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        var attributedString = NSMutableAttributedString(string:"")
        
        
        let buttonTitleStr = NSMutableAttributedString(string:"Terms of Use ", attributes:attrs)
        attributedString.append(buttonTitleStr)
        
        btnLink1.setAttributedTitle(attributedString, for: .normal)
        btnLink1.addTarget(self, action: #selector(didTapLink1), for: .touchUpInside)
        btnLink1.frame = CGRect(x: 0.05 * screenWidth, y: 0.95 * screenHeight, width: 0.3 * screenWidth, height: 0.01 * screenHeight)
        
        view.addSubview(btnLink1)
    }
    
    func createBtnLink2() {
        
        var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13.0),
        NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00),
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        
        var attributedString = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string:"Restore Purchase", attributes:attrs)
        attributedString.append(buttonTitleStr)
        
        btnLink2.setAttributedTitle(attributedString, for: .normal)
        btnLink2.addTarget(self, action: #selector(didTapLink2), for: .touchUpInside)
        btnLink2.frame = CGRect(x: 0.3 * screenWidth, y: 0.95 * screenHeight, width: 0.4 * screenWidth, height: 0.01 * screenHeight)
        
        view.addSubview(btnLink2)
    }
    
    func createBtnLink3() {
        
        var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13.0),
        NSAttributedString.Key.foregroundColor : UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00),
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        
        var attributedString = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string: "Privacy Policy", attributes:attrs)
        attributedString.append(buttonTitleStr)
        
        btnLink3.addTarget(self, action: #selector(didTapLink3), for: .touchUpInside)
        btnLink3.setAttributedTitle(attributedString, for: .normal)
        btnLink3.frame = CGRect(x: 0.66 * screenWidth, y: 0.95 * screenHeight, width: 0.3 * screenWidth, height: 0.01 * screenHeight)
        
        view.addSubview(btnLink3)
    }
    
    @objc func didTapLink1() {
        print("Terms of Use")
    }
    
    @objc func didTapLink2() {
        print("Restore Purchase")
    }
    
    @objc func didTapLink3() {
        print("Privacy Policy")
    }
    
    
}
