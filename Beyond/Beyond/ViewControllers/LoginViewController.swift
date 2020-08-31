//
//  LoginViewController.swift
//  Beyond
//
//  Created by Reynold Bascos on 8/29/20.
//  Copyright © 2020 Ryan Bascos. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleViews()
    }
    
    func styleViews() {
        ViewStyler.styleTextField(emailTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleTextField(passwordTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleHollowButton(loginButton, color: ViewStyler.coolBlue)
        errorLabel.alpha = 0
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func transitionToMainScreen() {
        let mainTabBarController = storyboard?.instantiateViewController(identifier: Constants.storyboards.mainTabBarController)
        view.window?.rootViewController = mainTabBarController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let errorMessage = validateFields()
        if errorMessage != nil {
            showError(errorMessage!)
        }
        else {
            //Sign the user into the Authentication database
            
            //Clean the user's info
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
                if error != nil {
                    self!.showError("Error: \(error!.localizedDescription)")
                }
                else {
                    self!.transitionToMainScreen()
                }
            }
        }
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
