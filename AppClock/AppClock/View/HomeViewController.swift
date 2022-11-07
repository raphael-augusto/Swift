//
//  HomeViewController.swift
//  AppClock
//
//  Created by Raphael Augusto on 06/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    
    private func getData() {
        let hour:Int = Int(Date().displayFomatHour)!
        print(hour)
        print(Date().displayFomat)

        switch hour {
        case 6..<12:
            print("Bom Dia")
            homeView.setupLayout(with: "Bom dia",color: .systemCyan,background: .systemYellow)
            
        case 12..<18:
            print("boa tarde")
            homeView.setupLayout(with: "boa tarde",color: .white, background: .systemCyan)
            
        case 18...23:
            print("boa noite")
            homeView.setupLayout(with: "boa noite",color: .white, background: .black)
            
        case 0..<5:
            print("Ainda está acordado?")
            homeView.setupLayout(with: "Ainda está acordado?",color: .white, background: .black)
            
        default:
            break
        }
    }
}



