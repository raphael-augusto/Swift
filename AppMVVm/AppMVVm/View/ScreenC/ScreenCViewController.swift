//
//  ScreenCViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenCViewController: UIViewController {

    private var viewModel = ScreenCViewModel()
    private var userName: String?
    private var age: String?
    
    private lazy var screenCView: ScreenCView = {
        let view = ScreenCView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = screenCView
    }
    
    
    init(userName: String, age: Int) {
        super.init(nibName: nil, bundle: nil)
        self.userName = userName
        self.age = String(age)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage()
        User()
    }
    
    
    private func titlePage() {
        screenCView.dataTitle(with: viewModel.dataTitle ?? "")
    }
    
    private func User() {
        self.screenCView.descriptionUser(userName: self.userName ?? "", userAge: age ?? "")
    }
}

//MARK: - Action
extension ScreenCViewController: ScreenCViewProtocol {

    func didTapScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
