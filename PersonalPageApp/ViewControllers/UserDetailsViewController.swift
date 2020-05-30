//
//  UserDetailsViewController.swift
//  PersonalPageApp
//
//  Created by Pavel Parshin on 29.05.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet var userPictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPictureView.layer.cornerRadius = 15
    }
    
    
    @IBAction func currentWorkButton(_ sender: UIButton) {
    }
    
    @IBAction func hobbyButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userMoreDetail = segue.destination as? UserMoreDetailsViewController else { return }
        if segue.identifier == "currentWorkSegue" {
            userMoreDetail.typeOfInformation = PersonInformation.currentWork
        }
        
        switch segue.identifier {
        case "currentWorkSegue": userMoreDetail.typeOfInformation = PersonInformation.currentWork
        case "hobbySegue": userMoreDetail.typeOfInformation = PersonInformation.hobby
        default:
            return
        }
    }
}
