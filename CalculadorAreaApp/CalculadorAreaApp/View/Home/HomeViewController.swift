//
//  HomeViewController.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Components View
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - life cycle
    override func loadView() {
        self.view = homeView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Action Button
extension HomeViewController: HomeViewProtocol {
    
    func didTapCircle() {
        print("Circle")
        
        let DescriptionOfSizeVC = DescriptionOfSizeViewController(descriptionFormat: "Circle")
        let navVC  = UINavigationController(rootViewController: DescriptionOfSizeVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    func didTapRectangle() {
        print("Rectangle")
        
        let DescriptionOfSizeVC = DescriptionOfSizeViewController(descriptionFormat: "Rectangle")
        let navVC  = UINavigationController(rootViewController: DescriptionOfSizeVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    func didTapTriangle() {
        print("Triangle")
        
        let DescriptionOfSizeVC = DescriptionOfSizeViewController(descriptionFormat: "Triangle")
        let navVC  = UINavigationController(rootViewController: DescriptionOfSizeVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
}
