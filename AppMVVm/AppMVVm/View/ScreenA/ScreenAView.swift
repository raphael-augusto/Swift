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
}

//MARK: - Components and Constraints
extension ScreenAView : ConfigurableView {
    
    func initSubviews() {
        addSubview(titleLabel)
        addSubview(goButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            goButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            goButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 240),
            goButton.heightAnchor.constraint(equalToConstant: 50),
        ])
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

