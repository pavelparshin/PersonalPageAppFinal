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
    
    var validUserName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.tag = 0
        userPasswordTextField.tag = 1
        userNameTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! UserWelcomeViewController
        welcomeVC.userName = validUserName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Buttons
    @IBAction func pressLogInButton() {
        
        if checkUserAccess(login: userNameTextField.text, password: userPasswordTextField.text)
        {
            performSegue(withIdentifier: "enterSegue", sender: nil)
        }
    }
    
    @IBAction func forgotLogInPassword(_ sender: UIButton)
    {
        switch sender.tag {
        case 0:
            let forgottenUserName = UserLogIn.getUserAccess().user
            showAlert(title: "Ooops!", message: "Your name is \(forgottenUserName)")
        case 1:
            let forgottenPassword = UserLogIn.getUserAccess().password
            showAlert(title: "Ooops!", message: "Your password is \(forgottenPassword)")
        default: break
        }
    }
    
    //Segue
    @IBAction func unwidSegue(segue: UIStoryboardSegue)
    {
        userNameTextField.text = ""
        userPasswordTextField.text = ""
        validUserName = ""
    }
}


//MARK: showAlert: UIAlertController, checkUserAccess
extension ViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userPasswordTextField.text = ""
        }
        alert.addAction(okAlertAction)
        present(alert, animated: true)
    }
    
    private func checkUserAccess(login: String?, password: String?) -> Bool {
        guard let login = login, !login.isEmpty else {
            showAlert(title: "Invalid login", message: "Please enter your User Name")
            return false
        }
               
        guard let password = userPasswordTextField.text, !password.isEmpty else {
            showAlert(title: "Invalid password", message: "Please enter your Password")
            return false
        }
        
        if login != UserLogIn.getUserAccess().user || password != UserLogIn.getUserAccess().password {
            showAlert(title: "Invalid access", message: "Please enter your valid User Name and Password")
            return false
        } else {
            validUserName = login
            return true
            
        }
    }
}

// MARK: textFieldShouldReturn
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       let txtTag:Int = textField.tag

        if let textFieldNxt = self.view.viewWithTag(txtTag+1) as? UITextField {
            textFieldNxt.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
}

