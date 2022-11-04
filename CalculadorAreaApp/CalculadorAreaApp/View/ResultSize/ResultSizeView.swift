//
//  ResultSizeView.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

protocol ResultSizeViewProtocol: AnyObject {
    func didTapbackscreen ()
}


final class ResultSizeView: UIView {
    
    var resuts: String?
    
    //MARK: - Delegate
    weak var delegate: ResultSizeViewProtocol?
    
    //MARK: - Properts
    private lazy var resultTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "129310293012"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private lazy var  backButton: UIButton = {
         let bt = UIButton()
         bt.translatesAutoresizingMaskIntoConstraints = false
         bt.backgroundColor = .systemBlue
         bt.setTitle("Voltar a tela principal", for: .normal)
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
    
    public func showData(with resuts: String) {
        self.resultTitle.text = resuts
    }
}

//MARK: - Components and Constraints
extension ResultSizeView : ConfigurableView {
    
    func initSubviews() {
        addSubview(resultTitle)
        addSubview(backButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            resultTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}


////MARK: - Action
extension ResultSizeView: ResultSizeViewProtocol {
    func addTargets() {
        backButton.addTarget(self, action: #selector(didTapbackscreen), for: .touchUpInside)
    }
    
    @objc func didTapbackscreen() {
        delegate?.didTapbackscreen()
    }
    

}

