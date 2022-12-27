//
//  CarResultViewController.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 26/12/22.
//

import UIKit

class CarResultViewController: UIViewController, ResultIMCViewDelegate {
    
    //MARK: - variables
    
    
    //MARK: - viewModel
    private let carResultViewModel = CarResultViewModel()
    
    
    //MARK: - View
    private lazy var carResultView: CarResultView = {
        let view = CarResultView()
        view.delegate = self
    
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = carResultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func configResult() {
        let dataCar = carResultViewModel.validationDayPlateCar()

        carResultView.resultCarDay(result: "O seu carro está disponivel \(dataCar)")
    }
}

extension CarResultViewController: CarResultViewDelegate {
   
    func backScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
