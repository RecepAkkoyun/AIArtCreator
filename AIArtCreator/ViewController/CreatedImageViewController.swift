//
//  CreatedImageViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 14.11.2022.
//

import UIKit
import Photos
import Lottie

class CreatedImageViewController: UIViewController {

    var lottieAnimation = LottieAnimationView()
    let imgBack = UIImageView()
    let imgDownload = UIImageView()
    let CreaterImage = UIImageView()
    let lblImageDetails = UILabel()
    var choosenCreation = Creation()
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white
        

        createImgBack()
        createImgdDownload()
        createCreaterImage()
        createLblImageDetails()
        
        imgBack.isUserInteractionEnabled = true
        let backGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBackBtn))
        imgBack.addGestureRecognizer(backGestureRecognizer)
        
        imgDownload.isUserInteractionEnabled = true
        let downloadGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapDownloadBtn))
        imgDownload.addGestureRecognizer(downloadGestureRecognizer)

    }
    func creatingAnimation() {
        lottieAnimation = .init(name: "animation")
        lottieAnimation.frame = CGRect(x: 50, y: 300, width: 200, height: 200)
        lottieAnimation.center = view.center
        lottieAnimation.loopMode = .playOnce
        view.addSubview(lottieAnimation)
        lottieAnimation.play { finished in
        }
    }
    
    func createImgBack() {
        imgBack.image = UIImage(named: "Icon_Home4_Back")
        imgBack.frame = CGRect(x: 0.02 * screenWidth, y: 0.07 * screenHeight, width: 0.1 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(imgBack)
    }
    
        @objc func didTapBackBtn() {
        let vc2 = HomeViewController()
        vc2.isHeroEnabled = true
        vc2.modalPresentationStyle = .fullScreen
        vc2.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc2, animated: true)
    }
    
    @objc func didTapDownloadBtn() {
        
        imgDownload.isHidden = true
        
        guard let image = choosenCreation.resultImage else {
            showAlert(title: "Something went wrong!", message: "We were unable to save the AI-generated artwork you created to photos. Please make sure the app has permission to save photos in settings and try again.", ViewController: self, Completion: {})
                    return
                }
                             
                var imageToSave = image
                PHPhotoLibrary.shared().performChanges {
                    _ = PHAssetChangeRequest.creationRequestForAsset(from: imageToSave)
                                 
                } completionHandler: { success, _ in
                    DispatchQueue.main.async { [self] in
                        if success {
                            showAlert(title: "Congrats!", message: "Download is successfull!", ViewController: self, Completion: {})
                        } else {
                            showAlert(title: "Something went wrong!", message: "We were unable to save the AI-generated artwork you created to photos. Please make sure the app has permission to save photos in settings and try again.", ViewController: self, Completion: {})
                        }
                    }
                }
        print("Gorsel indirildi")
    }
    
    func createCreaterImage() {
        CreaterImage.image = choosenCreation.resultImage
        CreaterImage.frame = CGRect(x: 0.07 * screenWidth , y: 0.15  * screenHeight, width: 0.86 * screenWidth, height: 0.65 *  screenHeight)
        view.addSubview(CreaterImage)
        
    }
    
    func createImgdDownload() {
        imgDownload.image = UIImage(named: "Icon_Save")
        imgDownload.frame = CGRect(x: 0.85 * screenWidth, y: 0.07 * screenHeight, width: 0.1 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(imgDownload)
    }
    
    func createLblImageDetails() {
        lblImageDetails.text = choosenCreation.prompt
        lblImageDetails.font = UIFont.boldSystemFont(ofSize: 25)
        lblImageDetails.textAlignment = .center
        lblImageDetails.frame = CGRect(x: 0.2 * screenWidth, y: 0.8 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        
        view.addSubview(lblImageDetails)
    }
    
    func showAlert(title : String , message : String, ViewController : UIViewController, Completion : @escaping () -> ()) {
        let showAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
        }
        showAlert.addAction(okButton)
        self.present(showAlert, animated: true, completion: nil)
    }
}

