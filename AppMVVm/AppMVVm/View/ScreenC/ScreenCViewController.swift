//
//  ScreenCViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenCViewController: UIViewController {

    private var viewModel = ScreenCViewModel()
    
    private lazy var screenCView: ScreenCView = {
        let view = ScreenCView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = screenCView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage()
    }
    
    
    private func titlePage() {
        screenCView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}

//MARK: - Action
extension ScreenCViewController: ScreenCViewProtocol {

    func didTapScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
