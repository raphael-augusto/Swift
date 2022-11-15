//
//  HomeViewController.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 14/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    private var viewModel = HomeViewModel()
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavBar()
    }
    
    private func configNavBar() {
        title = viewModel.dataTitle
        
        navigationController?.navigationBar.backgroundColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().barTintColor = .systemRed
        
    }
}

extension HomeViewController: HomeViewProtocol {
    func didTapScreen() {
        print("Tela dois")
    }
}
