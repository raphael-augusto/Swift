//
//  HomeIMCView.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 06/12/22.
//

import UIKit

protocol HomeIMCViewDelegate: AnyObject {
    func didTapGoResultScreen ()
}


final class HomeIMCView: UIView {
    
    //MARK: - Delegate
    weak var delegate: HomeIMCViewDelegate?
    
    
    //MARK: - Properts
    private lazy var weightLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Informe o seu peso"
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return lb
    }()
    
    private lazy var weightTextFiel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 26)
        tf.keyboardType = .decimalPad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu peso", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(8))
        
        return tf
    }()
    
    private lazy var heightLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Informe o sua altura"
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return lb
    }()
    
    private lazy var heightTextFiel: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 26)
        tf.keyboardType = .decimalPad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua altura", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(8))
        
        return tf
    }()
    
    private lazy var goCalculateButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .systemBlue
        bt.setTitle("Calcular", for: .normal)
        bt.layer.cornerRadius = 15
        bt.addTarget(self, action: #selector(didTapGoResultScreen), for: .touchUpInside)
        
        return bt
    }()
    
    
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
extension HomeIMCView : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(weightLabel)
        addSubview(weightTextFiel)
        addSubview(heightLabel)
        addSubview(heightTextFiel)
        addSubview(goCalculateButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            weightTextFiel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 24),
            weightTextFiel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weightTextFiel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            weightTextFiel.heightAnchor.constraint(equalToConstant: 42),
            
            heightLabel.topAnchor.constraint(equalTo: weightTextFiel.bottomAnchor, constant: 40),
            heightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            heightTextFiel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 24),
            heightTextFiel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            heightTextFiel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            heightTextFiel.heightAnchor.constraint(equalToConstant: 42),
             
            goCalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goCalculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goCalculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goCalculateButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
}


//MARK: - Func Public
extension HomeIMCView {
    
    public func weightTextFielTF() -> String {
        return self.weightTextFiel.text ?? ""
    }
    
    
    public func heightTextFielTF() -> String {
        return heightTextFiel.text ?? ""
    }
    
    
    public func clearTextField() {
        self.weightTextFiel.text = ""
        self.heightTextFiel.text = ""
    }
}


//MARK: - Action
extension HomeIMCView: HomeIMCViewDelegate {
    
    @objc func didTapGoResultScreen() {
        self.delegate?.didTapGoResultScreen()
    }
}

