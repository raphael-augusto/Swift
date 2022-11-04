//
//  DescriptionOfSizeViewController.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

enum Description: String {
    case Circle
    case Rectangle
    case Triangle
}

class DescriptionOfSizeViewController: UIViewController {
    
    //MARK: - Variable
    var descriptionFormat: Description?
    var result: String?
    
    
    //MARK: - Components View
    private lazy var descriptionOfSizeView: DescriptionOfSizeView = {
        let view = DescriptionOfSizeView()
        view.delegate = self
        
        guard let descriptionFormat = self.descriptionFormat else { return  view }
        view.hiddenComponent(with: descriptionFormat)
        
        return view
    }()
    
    
    //MARK: - life cycle
    override func loadView() {
        self.view = descriptionOfSizeView
    }
    
    init(descriptionFormat: String) {
        super.init(nibName: nil, bundle: nil)
        self.descriptionFormat = Description(rawValue: descriptionFormat)
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
        
        guard let descriptionFormat = self.descriptionFormat else { return }
        
        let data: String = CalculeteDescriotion(with: Description(rawValue: descriptionFormat.rawValue)!)
        
        let ResultSizeViewControllerVC = ResultSizeViewController(resuts: data)
        let navVC  = UINavigationController(rootViewController: ResultSizeViewControllerVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
        
        
    }
    
    private func CalculeteDescriotion(with description:  Description) -> String {
        
        switch description {
        case .Circle:
            
            guard let radius = Double(descriptionOfSizeView.radiusTextField.text ?? "0") else { return "" }
            let PI: Double = 3.14
            let operation = PI * ( radius * radius)

            result = "\(operation)"
            
            return result ?? ""
            
        case .Rectangle:
            
            guard let width = Double(descriptionOfSizeView.widthTextField.text ?? "0") else { return "" }
            guard let length = Double(descriptionOfSizeView.lengthTextField.text ?? "0") else { return "" }
            
            let operation = (width * length)
            
            result = "\(operation)"
            
            return result ?? ""
            
            
        case .Triangle:
            
            guard let width = Double(descriptionOfSizeView.widthTextField.text ?? "0") else { return "" }
            guard let length = Double(descriptionOfSizeView.lengthTextField.text ?? "0") else { return "" }
            
            let operation = (width * length) / 2
            
            result = "\(operation)"
            
            return result ?? ""
        }
    }
}
