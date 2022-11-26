//
//  HomeViewController.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 22/11/22.
//

import UIKit

class HomeViewController: UIViewController {
        
    //MARK: - Variables
    private var alert: Alert?
    private var dataPortAnimal: String? = ""
    
    
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
        title = "Age Animal"
        createDismissKeyboardTapGesture()
        self.alert = Alert(controller: self)
    }
    
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension HomeViewController: HomeViewProtocol {
 
    func suitDidChange(_ segmentedControl: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.dataPortAnimal = "small"
        case 1:
            self.dataPortAnimal = "medium"
        case 2:
            self.dataPortAnimal = "big"
        default:
            print("ERRO")
        }
        
    }
    
    
    func calculateDidButton() {
        guard let dataAge = homeView.ageAnimalTextField.text else { return }
        guard let dataPort = self.dataPortAnimal else { return }
        
        
        if dataAge != "" {
            let resultAgeAnimelVC = ResultAgeAnimelViewController(age: dataAge, portAnimal:dataPort)
            let navVC  = UINavigationController(rootViewController: resultAgeAnimelVC)
            navVC.modalPresentationStyle = .formSheet
            self.present(navVC, animated: true, completion: nil)
            
        } else {
            print("ERRRO")
            self.alert?.getAlert(title: "Atenção", message: "Campo de idade é obrigatório ser preenchido!")
        }
    }
}
