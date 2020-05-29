//
//  ViewController.swift
//  PersonalPageApp
//
//  Created by Pavel Parshin on 29.05.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pressLogInButton() {
    }
    
    @IBAction func unwidSegue(segue: UIStoryboardSegue)
    {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! UserWelcomeViewController
        welcomeVC.userName = userNameTextField.text
    }
}

//MARK: UIAlertController
extension UIViewController {
    
    private func forgotUserName(title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
    }
}

