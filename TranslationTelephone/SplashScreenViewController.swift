//
//  SplashScreenViewController.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/8/26.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var translationText: UILabel!
    @IBOutlet weak var telephoneText: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet var splashBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleSplashScreen()
    }

    func styleSplashScreen() {
        translationText.textColor = TTColor.mainText
        telephoneText.textColor = TTColor.mainText
        logo.tintColor = TTColor.mainText
        splashBackground.backgroundColor = TTColor.backgroundColor
        
        translationText.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 7)
        telephoneText.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 8))
    }
}

