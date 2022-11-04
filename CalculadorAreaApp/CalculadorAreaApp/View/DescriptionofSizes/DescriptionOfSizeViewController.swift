//
//  DescriptionOfSizeViewController.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

class DescriptionOfSizeViewController: UIViewController {
    
    //MARK: - Variable
    var descriptionFormat: String?
    var result: String?
    
    
    //MARK: - Components View
    private lazy var descriptionOfSizeView: DescriptionOfSizeView = {
        let view = DescriptionOfSizeView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - life cycle
    override func loadView() {
        self.view = descriptionOfSizeView
    }
    
    init(descriptionFormat: String) {
        super.init(nibName: nil, bundle: nil)
        self.descriptionFormat   = descriptionFormat
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()

    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension DescriptionOfSizeViewController: DescriptionOfSizeProtocol {
    func didTapCalculateSize() {
        
        let data: String = CalculeteDescriotion()
        
        let ResultSizeViewControllerVC = ResultSizeViewController(resuts: data)
        let navVC  = UINavigationController(rootViewController: ResultSizeViewControllerVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    private func CalculeteDescriotion() -> String {
        switch descriptionFormat {
        case "Circle":
            print("tela 2 Circle")
            let radius = NumberFormatter().number(from: descriptionOfSizeView.radiusTextField.text!)
            let PI: Double = 3.14
            let operation = PI * (NSNumber(value: radius!.doubleValue * radius!.doubleValue) as! Double)
            
            result = "\(operation)"

            
        case "Rectangle":
            print("tela 2 Rectangle")
            let width = NumberFormatter().number(from: descriptionOfSizeView.widthTextField.text!)
            let length = NumberFormatter().number(from: descriptionOfSizeView.lengthTextField.text!)
            let operation = (NSNumber(value: width!.doubleValue * length!.doubleValue))
            
            result = "\(operation)"
            
        case "Triangle":
            print("tela 2 Triangle")
            let width = NumberFormatter().number(from: descriptionOfSizeView.widthTextField.text!)
            let length = NumberFormatter().number(from: descriptionOfSizeView.lengthTextField.text!)
            let operation = (NSNumber(value: width!.doubleValue * length!.doubleValue) as! Double) / 2
            
            
            result = "\(operation)"
            
        default:
            "Deu ruim"
        }
        
        return result ?? ""
    }
}
