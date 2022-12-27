//
//  CarResultView.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 26/12/22.
//

import UIKit


protocol CarResultViewDelegate: AnyObject {
    func backScreen()
    func closeScreen()
}


final class CarResultView: UIView {
    
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
    
    
    private lazy var dayAvailableCarLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Resultado da sua pesquisa"
        lb.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return lb
    }()
    
    private lazy var resultDayAvailableCarLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        return lb
    }()
    
    
    private lazy var carImage: UIImageView = {
        let carImage  = UIImage(named: "car")
        let image               = UIImageView(image: carImage)
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
    
    
    public func resultCarDay(result: String) {
        self.resultDayAvailableCarLabel.text  = result
    }
}

//MARK: - Components and Constraints
extension CarResultView : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(container)
        addSubview(dayAvailableCarLabel)
        addSubview(resultDayAvailableCarLabel)
        addSubview(carImage)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            container.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            container.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            dayAvailableCarLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 60),
            dayAvailableCarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            resultDayAvailableCarLabel.topAnchor.constraint(equalTo: dayAvailableCarLabel.bottomAnchor, constant: 20),
            resultDayAvailableCarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultDayAvailableCarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            resultDayAvailableCarLabel.heightAnchor.constraint(equalToConstant: 42),
            
            carImage.topAnchor.constraint(equalTo: resultDayAvailableCarLabel.bottomAnchor, constant: 40),
            carImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImage.heightAnchor.constraint(equalToConstant: 380),
            carImage.widthAnchor.constraint(equalToConstant: 380),
        ])
    }
}


//MARK: - Action
extension CarResultView: CarResultViewDelegate {
    
    @objc func backScreen() {
        self.delegate?.backScreen()
    }
    
    
    @objc func closeScreen() {
        self.delegate?.closeScreen()
    }
}

