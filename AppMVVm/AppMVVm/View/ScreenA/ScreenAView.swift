//
//  ScreenAView.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

protocol ScreenAViewProtocol: AnyObject {
    func didTapScreen ()
}


final class ScreenAView: UIView {
    
    //MARK: - Delegate
    weak var delegate: ScreenAViewProtocol?

    
    //MARK: - Properts
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lb
    }()
    
    private lazy var userNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Informe o seu nome completo"
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return lb
    }()
    
    lazy var userNameTextFiel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 26)
        tf.keyboardType = .namePhonePad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu nome completo", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        tf.addPadding(.left(8))
          
        return tf
    }()
    
    private lazy var goButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .systemBlue
        bt.setTitle("Ok", for: .normal)
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
}

//MARK: - Components and Constraints
extension ScreenAView : ConfigurableView {
    
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(userNameLabel)
        addSubview(userNameTextFiel)
        addSubview(goButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            userNameTextFiel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24),
            userNameTextFiel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameTextFiel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userNameTextFiel.heightAnchor.constraint(equalToConstant: 42),
            
            goButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
}


//MARK: - Func Puclic
extension ScreenAView {
    public func dataTitle(with title: String) {
        self.titleLabel.text = title
    }
    
    public func userNameTF() -> String {
        return self.userNameTextFiel.text ?? ""
    }
    
    public func clearTextField() {
        self.userNameTextFiel.text = ""
    }
}


//MARK: - Action
extension ScreenAView:  ScreenAViewProtocol {
    
    func addTargets() {
        goButton.addTarget(self, action: #selector(didTapScreen), for: .touchUpInside)
    }
    
    
    @objc func didTapScreen() {
        self.delegate?.didTapScreen()
    }
}

