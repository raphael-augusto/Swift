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
    private var alert: Alert?
    
    
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
        self.alert = Alert(controller: self)
        
        titlePage()
    }
    
    
    //MARK: - Properts
    override func viewWillAppear(_ animated: Bool) {
        self.screenAView.clearTextField()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func titlePage() {
        screenAView.dataTitle(with: viewModel.dataTitle ?? "")
    }
}



//MARK: - Action
extension ScreenAViewController: ScreenAViewProtocol {
    
    func didTapScreen() {
        let data:String = self.screenAView.userNameTF()
        
        if viewModel.validateUserName(data) == true {
            print("Indo para screen B")
            
            let screenB = ScreenBViewController(userName: data)
            self.navigationController?.pushViewController(screenB, animated: true)
            
        } else {
            self.alert?.getAlert(title: "Atenção", message: "Tem que preencher com o nome completo")
        }
    }
}


