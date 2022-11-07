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
            homeView.renameTitle(with: "Bom dia",color: .systemCyan)
            homeView.backgroundColor = .systemYellow
        case 12..<18:
            print("boa tarde")
            homeView.renameTitle(with: "boa tarde",color: .white)
            homeView.backgroundColor = .systemCyan
        case 18...23:
            print("boa noite")
            homeView.renameTitle(with: "boa noite",color: .white)
            homeView.backgroundColor = .black
        case 0..<5:
            print("Ainda está acordado?")
            homeView.renameTitle(with: "Ainda está acordado?",color: .white)
            homeView.backgroundColor = .black
            
        default:
            break
        }
    }
}



