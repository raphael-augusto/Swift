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
    
    
    init(userName: String, age: String) {
        super.init(nibName: nil, bundle: nil)
        self.userName = userName
        self.age = age
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
        let userAger = viewModel.calcAge(birthday: self.age ?? "")
        
        self.screenCView.descriptionUser(userName: self.userName ?? "", userAge: String(userAger))
    }
}

//MARK: - Action
extension ScreenCViewController: ScreenCViewProtocol {

    func didTapScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
