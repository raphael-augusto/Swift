//
//  ScreenBViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenBViewController: UIViewController {

    private var viewModel = ScreenBViewModel()
    
    private lazy var screenBView: ScreenBView = {
        let view = ScreenBView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = screenBView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage()
        setupBind()
    }
    
    
    private func titlePage() {
        screenBView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}

//MARK: - Action
extension ScreenBViewController: ScreenBViewProtocol {
   
    private func setupBind() {
        viewModel.didTapScreen = { [weak self] in
            self?.didTapScreen()
        }
    }
    
    func didTapScreen() {
        let screenC = ScreenCViewController()
        let navVC  = UINavigationController(rootViewController: screenC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
}
