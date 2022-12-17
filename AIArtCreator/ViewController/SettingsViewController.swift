//
//  SettingsViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 11.11.2022.
//

import UIKit
import Hero

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let lblSettings = UILabel()
    let tableView = UITableView()
    var settingArr = [String]()
    var imgBack = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white

        settingArr.append("Try Premium")
        settingArr.append("Privacy Policy")
        settingArr.append("Terms of Use")
        settingArr.append("Restore Purchase")
        settingArr.append("Rate Us")
        settingArr.append("Send Feedback")
        
        imgBack.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBackBtn))
        imgBack.addGestureRecognizer(gestureRecognizer)
        
        createLblSettings()
        createTableView()
        createImgBack()
    }
    
    func createImgBack() {
        imgBack.image = UIImage(named: "Icon_Home4_Back")
        imgBack.frame = CGRect(x: 0.02 * screenWidth, y: 0.15 * screenWidth, width: 0.1 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(imgBack)
    }
    @objc func didTapBackBtn() {
        let vc2 = HomeViewController()
        vc2.isHeroEnabled = true
        vc2.modalPresentationStyle = .fullScreen
        vc2.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc2, animated: true)
    }
    
    func createLblSettings() {
        lblSettings.text = "Settings"
        lblSettings.font = lblSettings.font.withSize(25)
        lblSettings.textAlignment = .center
        lblSettings.frame = CGRect(x: 0.3 * screenWidth, y: 0.06 * screenHeight, width: 0.4 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(lblSettings)
    }
    
    func createTableView() {
        tableView.frame = CGRect(x: 0.02 * screenWidth , y: 0.15  * screenHeight, width: screenWidth, height: screenHeight)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = settingArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch settingArr[indexPath.row] {
        case "Try Premium":
            let destVC = InAppViewController()
            destVC.modalPresentationStyle = .fullScreen
            destVC.isSenderSettings = true
            present(destVC, animated: true)
            
        case "Privacy Policy":
            UIApplication.shared.openURL(NSURL(string: "https://www.neonapps.co/join-us")! as URL)
        case "Send Feedback":
            UIApplication.shared.openURL(NSURL(string: "https://www.google.com/intl/tr/gmail/about/#inbox")! as URL)
        default:
            break
        }
        
    }
    
}
