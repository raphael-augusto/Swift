//
//  ResultIMCView.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 10/12/22.
//


import UIKit

protocol ResultIMCViewDelegate: AnyObject {
    func backScreen ()
    func closeScreen ()
}


final class ResultIMCView: UIView {
    
    //MARK: - Delegate
    weak var delegate: ResultIMCViewDelegate?
    
    
    //MARK: - Properts
    private lazy var container: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(backButton)
        stack.addArrangedSubview(closeButton)
        
        return stack
    }()
    
    private lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Voltar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        bt.setTitleColor(.blue, for: .normal)
        
        
        bt.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        
        return bt
    }()
    
    private lazy var closeButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Fechar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        bt.setTitleColor(.blue, for: .normal)
        
        bt.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        
        return bt
    }()
    
    lazy var resultDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    lazy var resultValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    lazy var resultImage: UIImageView = {
        let image               = UIImageView()
        image.contentMode       = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
extension ResultIMCView : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(container)
        addSubview(resultDescription)
        addSubview(resultValue)
        addSubview(resultImage)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            container.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            container.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            resultDescription.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 60),
            resultDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            resultValue.topAnchor.constraint(equalTo: resultDescription.bottomAnchor, constant: 20),
            resultValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            resultImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140),
            resultImage.widthAnchor.constraint(equalToConstant: 180),
            resultImage.heightAnchor.constraint(equalToConstant: 180),
            resultImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}


//MARK: - Action
extension ResultIMCView: ResultIMCViewDelegate {
    
    @objc func backScreen() {
        self.delegate?.backScreen()
    }
    
    @objc func closeScreen() {
        self.delegate?.closeScreen()
    }
}

