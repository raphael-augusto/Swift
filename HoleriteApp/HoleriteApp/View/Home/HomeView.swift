//
//  HomeView.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 14/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func didTapScreen ()
}


final class HomeView: UIView {
    
    //MARK: - Delegate
    weak var delegate: HomeViewProtocol?
    
    
    //MARK: - Properts
    lazy var grossSalaryTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 20, weight: .regular)
        tf.keyboardType = .namePhonePad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.backgroundColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: "Salário bruto", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(15))
        
        return tf
      }()
    
    lazy var discountTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 20, weight: .regular)
        tf.keyboardType = .namePhonePad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.backgroundColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: "Descontos", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(15))
        
        return tf
      }()
    
    private lazy var goButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("CALCULAR", for: .normal)
        bt.layer.cornerRadius = 10
        
        //action
        bt.addTarget(self, action: #selector(didTapScreen), for: .touchUpInside)
        
        return bt
    }()
    
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        initLayout()
    }
}

//MARK: - Components and Constraints
extension HomeView : ConfigurableView {
    func initSubviews() {
        addSubview(grossSalaryTextField)
        addSubview(discountTextField)
        addSubview(goButton)
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            grossSalaryTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            grossSalaryTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            grossSalaryTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            grossSalaryTextField.heightAnchor.constraint(equalToConstant: 52),
            
            discountTextField.topAnchor.constraint(equalTo: grossSalaryTextField.bottomAnchor, constant: 15),
            discountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            discountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            discountTextField.heightAnchor.constraint(equalToConstant: 52),
            
            goButton.topAnchor.constraint(equalTo: discountTextField.bottomAnchor, constant: 50),
            goButton.heightAnchor.constraint(equalToConstant: 52),
            goButton.widthAnchor.constraint(equalToConstant: 180),
            goButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}


//MARK: - Action
extension HomeView: HomeViewProtocol {
    
    @objc func didTapScreen() {
        self.delegate?.didTapScreen()
    }
}

