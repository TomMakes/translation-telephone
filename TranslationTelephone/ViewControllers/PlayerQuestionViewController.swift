//
//  PlayerQuestionViewController.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/21/26.
//

import UIKit
#if canImport(Translation)
import Translation
import SwiftUI
#endif


class PlayerQuestionViewController: UIViewController {
    
    deinit {
        // Note, this view doesn't get destroyed currently when moving through app
        print("destroying PlayerQuestionViewController")
    }
    
    private var translationViewModel = TranslationViewModel()
    
    struct Language {
        let title: String
        let code: String
    }

    @IBOutlet var playerQuestionView: UIView!
    
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var FPSVLanguageButton: UIButton!
    
    @IBOutlet weak var FirstPlayerStackView: UIStackView!
    @IBOutlet weak var FPSVLabel1: UILabel!
    @IBOutlet weak var FPSVEnglishWordChoice: UITextField!
    @IBOutlet weak var FPSVLabel2: UILabel!
    
    
    @IBOutlet weak var nextPlayerStackView: UIStackView!
    @IBOutlet weak var NPSVLabel1: UILabel!
    @IBOutlet weak var NPSVLabel2: UILabel!
    @IBOutlet weak var NPSVLabel3: UILabel!
    @IBOutlet weak var NPSVLabel4: UILabel!
    @IBOutlet weak var NPSVLanguageButton: UIButton!
    @IBOutlet weak var NPSVLabel5: UILabel!
    
    
    
    @IBOutlet weak var chosenEnglishWord: UITextField!
    
    var firstPlayerViewShown = true
    var doDisplayResults = false
    var languages: [Language] = [
        Language( title: "English", code: "en" ),
        Language( title: "Catalan", code: "ca" ),
        Language( title: "Finnish", code: "fi" ),
        Language( title: "French", code: "fr" ),
        Language( title: "Spanish", code: "es" ),
    ];
    var originalLanguage: Locale.Language = Locale.Language(identifier: "en")
    var chosenLanguage: Locale.Language = Locale.Language(identifier: "en")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTranslationBridge()
        // Do any additional setup after loading the view.
        styleScreen()
        populateLanguageOptions()
        hideQuestions()
    }
    
    private func setupTranslationBridge() {
        let bridge = TranslationBridge(viewModel: translationViewModel) { session in
            Task {
                do {
                    // 1. Prepare for translation (downloads models if needed)
                    try await session.prepareTranslation()
                    
                    // 2. Perform your translation
                    let response = try await session.translate("Hello world")
                    print("Translated text: \(response.targetText)")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        
        // Add the bridge as a hidden child view
        let hostingController = UIHostingController(rootView: bridge)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.isHidden = true
        hostingController.didMove(toParent: self)
    }
    
    func styleScreen() {
        FPSVLabel1.textColor = TTColor.mainText
        FPSVLabel2.textColor = TTColor.mainText
        FPSVEnglishWordChoice.textColor = TTColor.buttonTextColor
        FPSVEnglishWordChoice.backgroundColor = TTColor.inputColor
        
        NPSVLabel1.textColor = TTColor.accentColor
        NPSVLabel2.textColor = TTColor.mainText
        NPSVLabel3.textColor = TTColor.mainText
        NPSVLabel4.textColor = TTColor.mainText
        NPSVLabel5.textColor = TTColor.mainText
        
        
        playerQuestionView.backgroundColor = TTColor.backgroundColor
    }
    
    func populateLanguageOptions() {
        print("Populating languages")
        // Create actions for the menu
        var menuOptions = [UIAction]()

        for lang in languages {
            menuOptions.append(UIAction(title: lang.title) { _ in self.chosenLanguage = Locale.Language(identifier: lang.code) })
        }

        // Assign the menu to your button
        FPSVLanguageButton.menu = UIMenu(title: "Select Language", children: menuOptions)
    }
    
    func hideQuestions() {
        FirstPlayerStackView.isHidden = false;
        nextPlayerStackView.isHidden = true;
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 1. Check if it's the specific segue we want to control
        if identifier == "QuestionsToResults" {
            // 2. Perform validation
            if chosenLanguage == Locale.Language(identifier: "en") {
                print("Unable to move forward, a new language wasn't selected")
                return false // 3. Cancel the segue
            }
        }
        
        // 4. Return true for other segues or if validation passes
        return true
    }
    
    @IBAction func TestButtonPressed2(_ sender: UIButton) {
        print(chosenLanguage)
        translateText()
    }
    
    @IBAction func translateButtonPressed(_ sender: UIButton) {
//        print(chosenLanguage)
//        translateText()
        
        moveToNextPlayer();
        
        if(firstPlayerViewShown) {
            FirstPlayerStackView.isHidden = true;
            nextPlayerStackView.isHidden = false;
        } else {
            FirstPlayerStackView.isHidden = false;
            nextPlayerStackView.isHidden = true;
        }
        firstPlayerViewShown = !firstPlayerViewShown;
    }
    

    @IBSegueAction func showResults(_ coder: NSCoder) -> GameResultsViewController? {
        return GameResultsViewController(coder: coder,
                                         responses: ["Hello", "World"])
    }
    
    func moveToNextPlayer() {
        print("Move to next player called")
        if doDisplayResults {
            performSegue(withIdentifier: "QuestionsToResults", sender: nil)
        } else {
          // display next player info
        }
    }
    

    func translateText() {
        translationViewModel.config = .init(source: .init(identifier: "en-US"),
                                                    target: .init(identifier: "fr-FR"))
    }
}
