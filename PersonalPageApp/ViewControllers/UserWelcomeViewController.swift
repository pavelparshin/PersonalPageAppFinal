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
    var userName: String?
    
    @IBOutlet var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = self.userName else { return }
        welcomeLabel.text = "Welcome \(userName)!"
        dayLabel.text = "Good \(phaseOfTheDay().rawValue)!"
    }
    
    @IBAction func pressLogOutButton() {
    }
    
    //Функция определяет фазу дня
    private func phaseOfTheDay() -> PhaseOfTheDay {
        switch getCurrentHour() {
        case 5..<12:   return .morning
        case 12..<18:  return .day
        case 18..<22:  return .evening
        default:       return .night
        }
    }
    
    //Определяем текущий час
    private func getCurrentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        return hour
    }
}

extension UserWelcomeViewController {
    
    //Градиентная заливка фона устанавливается в зависимости от фазы дня
    private func setGradientBackground() {
    
        var colorTop: CGColor
        switch phaseOfTheDay() {
        case .morning:
            colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        case .day:
            colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 0.3).cgColor
        case .evening:
            colorTop =  UIColor(red: 50.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        case .night:
            colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
        }
        
        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}
