//
//  UserWelcomeViewController.swift
//  PersonalPageApp
//
//  Created by Pavel Parshin on 29.05.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class UserWelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    var userName: String!
    
    @IBOutlet var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome \(userName)!"
        dayLabel.text = getGoodMessage()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pressLogOutButton() {
    }
    
    //функция определяет текущий час и создаёт предложение проведения хорошего утра, дня, вечера, ночи
    private func getGoodMessage() -> String {
        var message = "Good "
        
        switch getCurrentHour() {
        case 5...11:         message += "\(PhaseOfTheDay.morning)"
        case 12...18:        message += "\(PhaseOfTheDay.day)"
        case 19...21:        message += "\(PhaseOfTheDay.evening)"
        case 22...23, 0...4: message += "\(PhaseOfTheDay.night)"
        default:
            message = "Have a nice time!"
        }
        
        return message + "!"
    }
    
    //Определяем текущий час
    private func getCurrentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        return hour
    }
    
}