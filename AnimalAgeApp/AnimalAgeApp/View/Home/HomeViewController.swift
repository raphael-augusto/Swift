//
//  HomeViewController.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 22/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - ViewModel
    private var homeViewModel = HomeViewModel()
    
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
        title = homeViewModel.dataTitle
        createDismissKeyboardTapGesture()
        self.alert = Alert(controller: self)
    }
    
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func didTapAnimalPortSmallButton() {
        print("Pequeno")
        guard let dataAge = homeView.ageAnimalTextField.text else { return }
        
        if dataAge != "" {
            let resultAgeAnimelVC = ResultAgeAnimelViewController(age: dataAge, portAnimal: "small")
            let navVC  = UINavigationController(rootViewController: resultAgeAnimelVC)
            navVC.modalPresentationStyle = .formSheet
            self.present(navVC, animated: true, completion: nil)
        } else {
            print("ERRRO")
            self.alert?.getAlert(title: "Atenção", message: "Campo de idade é obrigatório ser preenchido!")
        }

    }
    
    func didTapAnimalPortMediumButton() {
        print("Médio")
        guard let dataAge = homeView.ageAnimalTextField.text else { return }
        
        if dataAge != "" {
            let resultAgeAnimelVC = ResultAgeAnimelViewController(age: dataAge, portAnimal: "medium")
            let navVC  = UINavigationController(rootViewController: resultAgeAnimelVC)
            navVC.modalPresentationStyle = .formSheet
            self.present(navVC, animated: true, completion: nil)
        } else {
            print("ERRRO")
            self.alert?.getAlert(title: "Atenção", message: "Campo de idade é obrigatório ser preenchido!")
        }
    }
    
    func didTapAnimalPortBigButton() {
        print("Grande")
        guard let dataAge = homeView.ageAnimalTextField.text else { return }
        
        if dataAge != "" {
            let resultAgeAnimelVC = ResultAgeAnimelViewController(age: dataAge, portAnimal: "big")
            let navVC  = UINavigationController(rootViewController: resultAgeAnimelVC)
            navVC.modalPresentationStyle = .formSheet
            self.present(navVC, animated: true, completion: nil)
        } else {
            print("ERRRO")
            self.alert?.getAlert(title: "Atenção", message: "Campo de idade é obrigatório ser preenchido!")
        }
    }
}
