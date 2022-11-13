//
//  ScreenBView.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//

import UIKit

protocol ScreenBViewProtocol: AnyObject {
    func didTapScreen ()
    func doneAction()
}

final class ScreenBView: UIView {
    
    //MARK: - Delegate
    weak var delegate: ScreenBViewProtocol?
    
    //MARK: - Properts
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lb
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.alignment = .center
        stack.axis = .horizontal
        stack.addArrangedSubview(titleUserNameLabel)
        stack.addArrangedSubview(userNameLabel)
        
        return stack
    }()
    
    private lazy var titleUserNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Nome: "
        lb.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return lb
    }()
    
    lazy var userNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return lb
    }()
    

    lazy var userBirthDateLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Informe a data de nascimento"
        lb.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return lb
    }()
    
   
    lazy var userBirthDateDatePiker: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 26)
        tf.textAlignment = .center
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.attributedPlaceholder = NSAttributedString(string: "Data", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        tf.addPadding(.left(8))
        tf.addPadding(.right(8))
        

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
    
    
    public func cancelTextField() {
        self.userBirthDateDatePiker.resignFirstResponder()
    }
}

//MARK: - Components and Constraints
extension ScreenBView : ConfigurableView {
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(stack)
        addSubview(userBirthDateLabel)
        addSubview(userBirthDateDatePiker)
        addSubview(goButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            userBirthDateLabel.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20),
            userBirthDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            userBirthDateDatePiker.topAnchor.constraint(equalTo: userBirthDateLabel.bottomAnchor, constant: 10),
            userBirthDateDatePiker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            goButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    
}

//MARK: - Func Puclic
extension ScreenBView {
    public func dataTitle(with title: String) {
        self.titleLabel.text = title
    }
    
    public func dataUserName(with username: String) {
        self.userNameLabel.text = username
    }
}
//MARK: - Action
extension ScreenBView:  ScreenBViewProtocol {
   
    private func addTargets() {
        goButton.addTarget(self, action: #selector(didTapScreen), for: .touchUpInside)
        userBirthDateDatePiker.setDatePickerAsInputViewFor(target: self, selector: #selector(doneAction))
    }

    @objc func doneAction() {
        self.delegate?.doneAction()
    }
    
    
    @objc func didTapScreen() {
        self.delegate?.didTapScreen()
    }
    
}
