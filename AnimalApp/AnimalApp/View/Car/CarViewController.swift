//
//  CarViewController.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 20/12/22.
//

import UIKit

class CarViewController: UIViewController {

    //MARK: - variables
    private var alert: Alert?
    
    
    //MARK: - ViewModel
    private let viewModelCar =  CarViewModel()
    
    
    //MARK: - View
    private lazy var carView: CarView = {
        let view = CarView()
        view.delegate = self
    
        return view
    }()
    
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = carView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carView.clearTextField()
        
        self.alert = Alert(controller: self)
        createDismissKeyboardTapGesture()
        configure()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    //MARK: - BarNavigation
    private func configure() {
        title = "Carro"
        
        navigationController?.navigationBar.backgroundColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
    }
    
    
}

//MARK: - Extension
extension CarViewController:  CarViewDelegate {
    func didTapScreen() {
        
        let dataPlateCar = viewModelCar.validatePlateCar(plate: carView.plateCarTextField.text.orEmpty)

        if dataPlateCar.isNilOrEmpety == false {
            let carResult = CarResultViewController()
            self.navigationController?.pushViewController(carResult, animated: true)
            
        } else {
            self.alert?.getAlert(title: "Atenção", message: "Necessário fazer o preenchimento corretamente.")
        }
    }
}
