//
//  HomeViewController.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 14/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - ViewModel
    private var viewModel = HomeViewModel()
    
    
    //MARK: - Variables
    private var alert: Alert?
    
    
    //MARK: - Properts
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        
        return view
    }()
    
    //MARK: - Life cycle
    override func loadView() {
        self.view = homeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
        
        configNavBar()
    }
    
    
    private func configNavBar() {
        title = viewModel.dataTitle
        
        navigationController?.navigationBar.backgroundColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}


//MARK: - Action
extension HomeViewController: HomeViewProtocol {
    
    func didTapScreen() {
        let dataSalary   = viewModel.validateGrossSalary(with: homeView.grossSalaryTextField.text ?? "")
        let dataDiscount = viewModel.validateGrossSalary(with: homeView.discountTextField.text ?? "0")
        
        if dataSalary != "" {            
            let resultCalculateVC = ResultCalculateViewController(grossSalary: dataSalary, discount: dataDiscount)
            let navVC  = UINavigationController(rootViewController: resultCalculateVC)
            navVC.modalPresentationStyle = .formSheet
            self.present(navVC, animated: true, completion: nil)
            
        } else {
            print("Error - campo salário bruto não preenchido!")
            self.alert?.getAlert(title: "Atenção", message: "Campo salário bruto é obrigatório ser preenchido!")
        }
    }
}
