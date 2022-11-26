//
//  ResultAgeAnimelViewController.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 24/11/22.
//

import UIKit


class ResultAgeAnimelViewController: UIViewController {
    
    //MARK: - ViewModel
    private var resultAgeAnimalViewModel = ResultAgeAnimalViewModel()


    //MARK: - Variables
    private var age: String?
    private var portAnimal: String?
    
    
    //MARK: - Properts
    private lazy var resultAgeAnimalView: ResultAgeAnimalView = {
        let view = ResultAgeAnimalView()

        return view
    }()

    
    //MARK: - Life cycle
    override func loadView() {
        self.view = resultAgeAnimalView
    }
    
    init(age: String, portAnimal: String) {
        super.init(nibName: nil, bundle: nil)
        self.age        = age
        self.portAnimal = portAnimal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDate()
    }
    
    
    func getDate() {
        resultAgeAnimalView.animalImage.image =  resultAgeAnimalViewModel.animalImage(portAnimal: PortAnimal(rawValue: self.portAnimal!)!)
        
        resultAgeAnimalView.resultAgeHumanLabel.text = resultAgeAnimalViewModel.humanAge(age: self.age ?? "0", portAnimal: PortAnimal(rawValue: self.portAnimal!)!)
        
        resultAgeAnimalView.resultAgeAnimalLabel.text = resultAgeAnimalViewModel.animalAge(age: self.age ?? "0", portAnimal: PortAnimal(rawValue: self.portAnimal!)!)
    }
}
