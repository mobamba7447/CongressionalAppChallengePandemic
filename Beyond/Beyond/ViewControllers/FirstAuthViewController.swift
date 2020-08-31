//
//  FirstAuthViewController.swift
//  Beyond
//
//  Created by Ryan Bascos on 8/29/20.
//  Copyright © 2020 Ryan Bascos. All rights reserved.
//

import UIKit

class FirstAuthViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleViews()
    }
    
    func styleViews() {
        ViewStyler.styleFilledButton(signUpButton, color: ViewStyler.coolAqua)
        ViewStyler.styleHollowButton(loginButton, color: ViewStyler.coolAqua)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
