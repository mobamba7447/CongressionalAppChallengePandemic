//
//  SignUpViewController.swift
//  Beyond
//
//  Created by Ryan Bascos on 8/29/20.
//  Copyright © 2020 Ryan Bascos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleViews()
    }
    
    func styleViews() {
        ViewStyler.styleTextField(firstNameTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleTextField(lastNameTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleTextField(emailTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleTextField(passwordTextField, color: ViewStyler.coolBlue)
        ViewStyler.styleFilledButton(signUpButton, color: ViewStyler.coolBlue)
        errorLabel.alpha = 0
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !isPasswordValid(cleanPassword) {
            return "Password is not secure enough. Please make sure your password is at least 8 characters long, contains a special character, and a number."
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
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        let errorMessage = validateFields()
        if errorMessage != nil {
            showError(errorMessage!)
        }
        else {
            //Create a new user in both the Authentication database (with Auth.auth().createUser()) and the Cloud Firestore (with db.collection("users").addDocument())
            
            //Clean the user's info
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Creating a new user generates a unique id (uid) for that user and stores that id in result
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                if error != nil {
                    self!.showError("Error: \(error!.localizedDescription)")
                }
                else {
                    //Create a new reference to the Cloud Firestore and store the user's info there (Note: despite the Firestore docs, db does NOT need to be declared in AppDelegate.swift. It can be declared anywhere).
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstName" : firstName,
                        "lastName" : lastName,
                        "uid" : result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            self!.showError("Error saving user to database.")
                        }
                    }
                    
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
