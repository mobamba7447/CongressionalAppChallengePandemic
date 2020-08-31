//
//  ViewStyler.swift
//  Beyond
//
//  Created by Reynold Bascos on 8/29/20.
//  Copyright © 2020 Ryan Bascos. All rights reserved.
//

import Foundation
import UIKit

//This class contains methods to style UIViews. Since CALayers are designed for style/animation, use these to style your UIViews rather than accessing the UIView itself (e.g. using button.layer.backgroundColor instead of button.backgroundColor). UIViews are meant for handling user interaction, not necessarily design.

class ViewStyler {
    
    //in order for static functions to access class constants, the constants must be static as well
    static let traitCollection = UITraitCollection()
    
    static let darkBlue = UIColor(red: 0, green: 80/255, blue: 115/255, alpha: 1)
    static let fadedBlue = UIColor(red: 16/255, green: 125/255, blue: 172/255, alpha: 1)
    static let coolBlue = UIColor(red: 24/255, green: 154/255, blue: 211/255, alpha: 1)
    static let coolAqua = UIColor(red: 30/255, green: 187/255, blue: 215/255, alpha: 1)
    static let fadedSky = UIColor(red: 113/255, green: 199/255, blue: 236/255, alpha: 1)
    static let coolWhite = UIColor(red: 248/255, green: 252/255, blue: 255/255, alpha: 1)
    
    static func styleTextField(_ textField: UITextField, color: UIColor) {
        
        //Remove the border
        textField.borderStyle = .none
        
        //Create and add the layer (a rectangle)
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height-7, width: textField.frame.width-40, height: 2)
        //Determines the bottomLine's color based on whether the user is on light or dark mode
        /*
        switch traitCollection.userInterfaceStyle {
        case .light:
            bottomLine.backgroundColor = darkBlue
        case .dark:
            bottomLine.backgroundColor = coolAqua
        default:
            bottomLine.backgroundColor = coolAqua
        }
 */
        bottomLine.backgroundColor = color.cgColor
        
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton, color: UIColor) {
        button.layer.backgroundColor = color.cgColor
        button.layer.cornerRadius = 15
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton, color: UIColor) {
        button.layer.borderWidth = 3
        button.layer.borderColor = color.cgColor
        button.layer.cornerRadius = 15
        button.tintColor = color
    }
    
}
