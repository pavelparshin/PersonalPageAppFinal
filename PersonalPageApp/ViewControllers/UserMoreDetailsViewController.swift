//
//  UserMoreDetailsViewController.swift
//  PersonalPageApp
//
//  Created by Pavel Parshin on 29.05.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class UserMoreDetailsViewController: UIViewController {
    
    @IBOutlet var currentJobStackView: UIStackView!
    @IBOutlet var hobbyStackView: UIStackView!
    
    var typeOfInformation: PersonInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch typeOfInformation {
        case .currentWork: 
            currentJobStackView.isHidden = false
            hobbyStackView.isHidden = true
        case .hobby:
            currentJobStackView.isHidden = true
            hobbyStackView.isHidden = false
        default: return
        }
    }
}
