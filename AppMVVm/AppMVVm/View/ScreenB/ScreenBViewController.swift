//
//  ScreenBViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenBViewController: UIViewController {

    private var viewModel = ScreenBViewModel()
    
    
    //MARK: - VIEW
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
    }
    
    
    //MARK: - Properts
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func titlePage() {
        screenBView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}

//MARK: - Action
extension ScreenBViewController: ScreenBViewProtocol {
    
    func didTapScreen() {
        let screenC = ScreenCViewController()
        self.navigationController?.pushViewController(screenC, animated: true)
    }
}
