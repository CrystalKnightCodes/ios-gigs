//
//  LoginViewController.swift
//  Gigs
//
//  Created by Christy Hicks on 11/7/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var signUpSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signUpLogInToggle(_ sender: UISegmentedControl) {
    }
    
    @IBAction func signUpLoginTapped(_ sender: UIButton) {
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
