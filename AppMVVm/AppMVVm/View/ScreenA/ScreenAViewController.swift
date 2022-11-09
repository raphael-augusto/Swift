//
//  ScreenAViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenAViewController: UIViewController {

    //MARK: - variables
    private var viewModel = ScreenAViewModel()
    
    
    //MARK: - Properts
    private lazy var screenAView: ScreenAView = {
        let view = ScreenAView()
        view.delegate = self
        
        return view
    }()
    
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = screenAView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage()
        setupBind()
    }
    
    
    //MARK: - Show Properts
    private func titlePage() {
        screenAView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}


//MARK: - Action
extension ScreenAViewController: ScreenAViewProtocol {

    private func setupBind() {
        viewModel.didTapScreen = { [weak self] in
            self?.didTapScreen()
        }
    }
    
    func didTapScreen() {
        let screenB = ScreenBViewController()
        let navVC  = UINavigationController(rootViewController: screenB)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
}


