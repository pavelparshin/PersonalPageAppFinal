//
//  ViewController.swift
//  PersonalPageApp
//
//  Created by Pavel Parshin on 29.05.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//
/*
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    var validateLogIn = false
    var validateName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pressLogInButton() {
    }
    
    @IBAction func forgotUserNameAction() {
        let forgottenUserName = UserLogIn.getUserAccess().user
        showAlert(title: "Ooops!", message: "Your name is \(forgottenUserName)")
    }
    
    @IBAction func forgotPasswordAction() {
        let forgottenPassword = UserLogIn.getUserAccess().password
        showAlert(title: "Ooops!", message: "Your password is \(forgottenPassword)")
    }
    
    @IBAction func unwidSegue(segue: UIStoryboardSegue)
    {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let inputUserName = userNameTextField.text, !inputUserName.isEmpty else {
            showAlert(title: "Invalid login", message: "Please enter your User Name")
            return
        }
        
        guard let inputPassword = userPasswordTextField.text, !inputPassword.isEmpty else {
            showAlert(title: "Invalid password", message: "Please enter your Password")
            return
        }
        
        if checkUserAccess(login: inputUserName, password: inputPassword) {
            let welcomeVC = segue.destination as! UserWelcomeViewController
            welcomeVC.userName = inputUserName
        }
    }
}

//MARK: UIAlertController, checkUserAccess
extension ViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userPasswordTextField.text = ""
        }
        alert.addAction(okAlertAction)
        present(alert, animated: true)
    }
    
    private func checkUserAccess(login: String, password: String) -> Bool {
        if login != UserLogIn.getUserAccess().user && password != UserLogIn.getUserAccess().password {
            showAlert(title: "Invalid access", message: "Please enter your valid User Name and Password")
            return false
        } else {
            return true
            
        }
    }
}

*/
