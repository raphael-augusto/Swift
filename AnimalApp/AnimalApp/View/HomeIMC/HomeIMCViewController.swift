//
//  HomeIMCViewController.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 06/12/22.
//

import UIKit

class HomeIMCViewController: UIViewController {

    //MARK: - variables
    private var homeIMCViewModel = HomeIMCViewModel()
    private var alert: Alert?
    
    
    //MARK: - View
    private lazy var homeView: HomeIMCView = {
        let view = HomeIMCView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
        createDismissKeyboardTapGesture()
        
        homeView.clearTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}


//MARK: - Action button
extension HomeIMCViewController: HomeIMCViewDelegate {
    
    func didTapGoResultScreen() {
        let dataIMC = homeIMCViewModel.validationDataIMC(with: homeView.weightTextFielTF(), height: homeView.heightTextFielTF())
        
        if dataIMC.weight != "0.0" || dataIMC.height != "0.0"{
            let resultIMC = ResultIMCViewController(weight: dataIMC.weight!, height: dataIMC.height!)
            self.navigationController?.pushViewController(resultIMC, animated: true)
            
        }else {
            self.alert?.getAlert(title: "Atenção", message: "Os campos devem ser preenchidos!!")
        }
    }
}
