//
//  ScreenCView.swift
//  AppMVVM
//
//  Created by Raphael Augusto on 08/11/22.
//


import UIKit


protocol ScreenCViewProtocol: AnyObject {
    func didTapScreen ()
}

final class ScreenCView: UIView {
    
    //MARK: - Delegate
    weak var delegate: ScreenCViewProtocol?
    
    //MARK: - Properts
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lb
    }()
    
    private lazy var stackUserName: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.alignment = .center
        stack.axis = .horizontal
        stack.addArrangedSubview(userLabel)
        stack.addArrangedSubview(userNameLabel)
        
        return stack
    }()
    
    private lazy var userLabel: UILabel = {
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
        lb.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return lb
    }()
    
    
    private lazy var stackUserAge: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.alignment = .center
        stack.axis = .horizontal
        stack.addArrangedSubview(ageLabel)
        stack.addArrangedSubview(userAgeLabel)
        
        return stack
    }()
    
    private lazy var ageLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Idade: "
        lb.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return lb
    }()
    
    lazy var userAgeLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return lb
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
    
    
    public func dataTitle(with title: String) {
        self.titleLabel.text = title
    }
    
    public func descriptionUser (userName: String, userAge: String) {
        self.userNameLabel.text = userName
        self.userAgeLabel.text  = userAge
    }
}

//MARK: - Components and Constraints
extension ScreenCView : ConfigurableView {
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(stackUserName)
        addSubview(stackUserAge)
        addSubview(goButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackUserName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            stackUserName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            stackUserAge.topAnchor.constraint(equalTo: stackUserName.bottomAnchor, constant: 20),
            stackUserAge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            goButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    
}


//MARK: - Action
extension ScreenCView:  ScreenCViewProtocol {
    
    func addTargets() {
        goButton.addTarget(self, action: #selector(didTapScreen), for: .touchUpInside)
    }
    
    
    @objc func didTapScreen() {
        self.delegate?.didTapScreen()
    }
}
