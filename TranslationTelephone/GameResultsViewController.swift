//
//  GameResultsViewController.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/21/26.
//

import UIKit

class GameResultsViewController: UIViewController {
    
    
    @IBOutlet weak var gameSummaryStackView: UIStackView!
    
    
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
    }
    
    func testAddingResults() {
        let newLabel = UILabel()
        newLabel.text = "Hello, StackView!"
        newLabel.textColor = .black
        newLabel.font = .systemFont(ofSize: 16)
        
        gameSummaryStackView.insertArrangedSubview(newLabel, at: 0)
    }
    
    @IBAction func replayButtonPressed(_ sender: Any) {
        restartGame()
    }
    func restartGame() {
        performSegue(withIdentifier: "ResultsToSplash", sender: nil)
    }

}
