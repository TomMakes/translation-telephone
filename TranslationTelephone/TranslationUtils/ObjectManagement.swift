//
//  ObjectManagement.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/30/26.
//

import Foundation
import UIKit

struct om {
    static func createLabel(labelText: String, style: String = "Regular") -> UILabel {
        let newLabel = UILabel()
        newLabel.text = labelText
        newLabel.textColor = .black
        switch style {
        case "Regular":
            newLabel.font = UIFont.systemFont(ofSize: 16.0)
        case "Bold":
            newLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        default:
            newLabel.font = UIFont.systemFont(ofSize: 16.0)
        }
        
        return newLabel
    }
    
    static func createStackView() -> UIStackView {
        let stackView = UIStackView()
        
        // Configure axis and layout properties
        stackView.axis = .vertical // or .horizontal
        stackView.distribution = .fillEqually // Defines how views fill space
        stackView.alignment = .fill // Defines how views align within the stack
        stackView.spacing = 10 // Space between views in points
        
        // Mandatory for programmatic layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
}
