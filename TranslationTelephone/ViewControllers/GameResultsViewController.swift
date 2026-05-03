//
//  GameResultsViewController.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/21/26.
//

import UIKit

class GameResultsViewController: UIViewController {
    
    
//    @IBOutlet weak var gameSummaryStackView: UIStackView!
    @IBOutlet weak var vertStackParentScroll: UIStackView!
    
    
    var responses: [String]
    
    init?(coder: NSCoder, responses: [String]) {
        print("Initialized view")
        self.responses = responses
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(responses)
        // Do any additional setup after loading the view.
        testAddingResults()
        testAddingStackViewWithLabels()
    }
    
    func testAddingStackViewWithLabels() {
        let pronounced = om.createLabel(labelText: "When pronounced by the next player,")
        let interpreted = om.createLabel(labelText: "it was interpreted as")
        let nonEnglish = om.createLabel(labelText: "non-English word", style: "Bold")
        let meaning = om.createLabel(labelText: "which means")
        let engWord = om.createLabel(labelText: "English word.", style: "Bold")
        
        let newStackView = om.createStackView()
        newStackView.addArrangedSubview(pronounced)
        newStackView.addArrangedSubview(interpreted)
        newStackView.addArrangedSubview(nonEnglish)
        newStackView.addArrangedSubview(meaning)
        newStackView.addArrangedSubview(engWord)
        
        vertStackParentScroll.addArrangedSubview(newStackView)
    }
    
    func testAddingResults() {
        let newLabel = UILabel()
        newLabel.text = "Hello, StackView!"
        newLabel.textColor = .black
        newLabel.font = .systemFont(ofSize: 16)
        
//        gameSummaryStackView.insertArrangedSubview(newLabel, at: 0)
    }
    
    @IBAction func replayButtonPressed(_ sender: Any) {
        restartGame()
    }
    func restartGame() {
        performSegue(withIdentifier: "ResultsToSplash", sender: nil)
    }

}
