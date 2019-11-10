//
//  LoginViewController.swift
//  Gigs
//
//  Created by Christy Hicks on 11/7/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case login
}

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var signUpSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Properties
    var gigController: GigController!
    var loginType: LoginType = .signUp
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signUpLogInToggle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            signUpButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .login
            signUpButton.setTitle("Log In", for: .normal)
        }
    }
    
    @IBAction func signUpLoginTapped(_ sender: UIButton) {
        guard let gigController = gigController else { print("46"); return }
        if let username = usernameTextField.text,
            !username.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty {
            let user = User(username: username, password: password)
            
            if loginType == .signUp {
                gigController.signUp(with: user) { error in
                    if let error = error {
                        print("Error occurred during sign up: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in.", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: {
                                self.loginType = .login
                                self.signUpSegmentedControl.selectedSegmentIndex = 1
                                self.signUpButton.setTitle("Log In", for: .normal)
                            })
                        }
                    }
                }
            } else {
                gigController.login(with: user) { error in
                    if let error = error {
                        print("Error occurred during sign up: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
}
