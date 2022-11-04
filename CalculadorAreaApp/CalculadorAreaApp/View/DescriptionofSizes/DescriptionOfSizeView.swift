//
//  DescriptionOfSizeView.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

protocol DescriptionOfSizeProtocol: AnyObject {
    func didTapCalculateSize ()
}


final class DescriptionOfSizeView: UIView {
        
    
    //MARK: - Delegate
    weak var delegate: DescriptionOfSizeProtocol?
    
    
    //MARK: - Properts
    private lazy var parametersTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informe os parâmetros"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private lazy var parametersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.addArrangedSubview(widthTextField)
        stackView.addArrangedSubview(lengthTextField)
        stackView.addArrangedSubview(radiusTextField)
        
        return stackView
    }()
    
    
    lazy var widthTextField: UITextField = {
        let textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .boldSystemFont(ofSize: 26)
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "largura", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        return textField
    }()
    
    lazy var lengthTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .boldSystemFont(ofSize: 26)
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "Comprimento", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        return textField
    }()
    
    lazy var radiusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = .boldSystemFont(ofSize: 26)
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "Raio", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        return textField
    }()
    
    private lazy var  calculateButton: UIButton = {
         let bt = UIButton()
         bt.translatesAutoresizingMaskIntoConstraints = false
         bt.backgroundColor = .systemBlue
         bt.setTitle("Calculatar", for: .normal)
         bt.layer.cornerRadius = 15
         
         return bt
     }()
    
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        initLayout()
        addTargets()
    }
    
    public func hiddenComponent (with data: Description?) {
        if data == .Circle {
            lengthTextField.isHidden = true
            widthTextField.isHidden = true
        } else {
            radiusTextField.isHidden = true
        }
    }
}



//MARK: - Components and Constraints
extension DescriptionOfSizeView : ConfigurableView {
    
    func initSubviews() {
        addSubview(parametersTitle)
        addSubview(parametersStackView)
        addSubview(calculateButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            parametersTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            parametersTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            parametersStackView.topAnchor.constraint(equalTo: parametersTitle.bottomAnchor, constant: 80),
            parametersStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            parametersStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            calculateButton.topAnchor.constraint(equalTo: parametersStackView.bottomAnchor, constant: 80),
            calculateButton.heightAnchor.constraint(equalToConstant: 52),
            calculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    
}


//MARK: - Action
extension DescriptionOfSizeView: DescriptionOfSizeProtocol {
    func addTargets() {
        calculateButton.addTarget(self, action: #selector(didTapCalculateSize), for: .touchUpInside) 
    }
    
    @objc func didTapCalculateSize() {
        delegate?.didTapCalculateSize()
    }
}

