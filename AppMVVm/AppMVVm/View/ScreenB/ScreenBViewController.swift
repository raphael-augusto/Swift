//
//  ScreenBViewController.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

class ScreenBViewController: UIViewController {

    private var viewModel = ScreenBViewModel()
    private var alert: Alert?
    
    private var userName: String?
    private var age: String?
    
    
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
    
    init(userName: String) {
        super.init(nibName: nil, bundle: nil)
        self.userName = userName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
        
        titlePage()
        dataUserName()
    }
    
    
    //MARK: - Properts
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func titlePage() {
        screenBView.dataTitle(with: viewModel.dataTitle ?? "")
    }
    
    private func dataUserName() {
        screenBView.dataUserName(with: userName ?? "")
    }
}

//MARK: - Action
extension ScreenBViewController: ScreenBViewProtocol {
    func doneAction() {
        if let datePicker = self.screenBView.userBirthDateDatePiker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            self.screenBView.userBirthDateDatePiker.text = dateFormatter.string(from: datePicker.date)
            
            self.age = self.screenBView.userBirthDateDatePiker.text
        }
        
        self.screenBView.userBirthDateDatePiker.resignFirstResponder()
    }
    
    
    func didTapScreen() {
        
        let dataUser = viewModel.calcBirthday(birthday: self.age ?? "")
        
        if dataUser == true {
            let screenC = ScreenCViewController(userName: self.userName ?? "", age: self.age ?? "")
            self.navigationController?.pushViewController(screenC, animated: true)
            
        } else {
            self.alert?.getAlert(title: "Atenção", message: "Preencha o campo de data corretamente")
        }
        

    }
}

