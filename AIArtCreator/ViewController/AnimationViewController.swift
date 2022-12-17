//
//  AnimationViewController.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 15.11.2022.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    
    var lottieAnimation = LottieAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        creatingAnimation()
    }
    func creatingAnimation() {
        lottieAnimation = .init(name: "animation")
        lottieAnimation.frame = CGRect(x: 50, y: 300, width: 200, height: 200)
        lottieAnimation.center = view.center
        lottieAnimation.loopMode = .playOnce
        view.addSubview(lottieAnimation)
        lottieAnimation.play { finished in
            self.presentVC()
        }
    }
    
    func presentVC() {
        var destinationVC = CreatedImageViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: false)
    }
            
}
