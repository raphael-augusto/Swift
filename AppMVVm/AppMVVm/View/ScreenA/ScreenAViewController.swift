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
    
    
    //MARK: - VIEW
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
    }
    
    
    //MARK: - Properts
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func titlePage() {
        screenAView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}


//MARK: - Action
extension ScreenAViewController: ScreenAViewProtocol {
    
    func didTapScreen() {
        let screenB = ScreenBViewController()
        self.navigationController?.pushViewController(screenB, animated: true)
    }
}


