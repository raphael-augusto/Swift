//
//  HomeView.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 23/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func didTapAnimalPortSmallButton ()
    func didTapAnimalPortMediumButton ()
    func didTapAnimalPortBigButton ()
}


final class HomeView: UIView {
    
    //MARK: - Delegate
    weak var delegate: HomeViewProtocol?
    
    
    //MARK: - Properts
   
    private lazy var ageAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Informe a idade do animal:"
        
        return label
    }()
    
    lazy var ageAnimalTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 20, weight: .regular)
        tf.keyboardType = .numberPad
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.backgroundColor = .white
        tf.attributedPlaceholder = NSAttributedString(string: "Idade do animal", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(15))
        
        return tf
    }()
    
    
    private lazy var sizeOfTheAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Selecione o porte do animal:"
        
        return label
    }()
    
    
    private lazy var containerButton: UIStackView = {
        let container = UIStackView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .center
        container.distribution = .fillEqually
        container.axis = .horizontal
        container.spacing = 5
        container.addArrangedSubview(smallButton)
        container.addArrangedSubview(mediumButton)
        container.addArrangedSubview(bigButton)
        
        return container
    }()
    
    
    private lazy var smallButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("Pequeno", for: .normal)
        bt.layer.cornerRadius = 10

        return bt
    }()
    
    
    private lazy var mediumButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("Médio", for: .normal)
        bt.layer.cornerRadius = 10

        return bt
    }()
    
    private lazy var bigButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("Grande", for: .normal)
        bt.layer.cornerRadius = 10

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
        addTargets()
    }
}

//MARK: - Components and Constraints
extension HomeView : ConfigurableView {
    
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(ageAnimalLabel)
        addSubview(ageAnimalTextField)
        addSubview(sizeOfTheAnimalLabel)
        addSubview(containerButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            ageAnimalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            ageAnimalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            ageAnimalTextField.topAnchor.constraint(equalTo: ageAnimalLabel.bottomAnchor, constant: 20),
            ageAnimalTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ageAnimalTextField.heightAnchor.constraint(equalToConstant: 52),
            ageAnimalTextField.widthAnchor.constraint(equalToConstant: 180),
            
            
            sizeOfTheAnimalLabel.topAnchor.constraint(equalTo: ageAnimalTextField.bottomAnchor, constant: 20),
            sizeOfTheAnimalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            containerButton.topAnchor.constraint(equalTo: sizeOfTheAnimalLabel.bottomAnchor, constant: 8),
            containerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerButton.heightAnchor.constraint(equalToConstant: 80),
            

        ])
    }
    
}


//MARK: - Action
extension HomeView: HomeViewProtocol {
    private func addTargets() {
        smallButton.addTarget(self, action: #selector(didTapAnimalPortSmallButton), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(didTapAnimalPortMediumButton), for: .touchUpInside)
        bigButton.addTarget(self, action: #selector(didTapAnimalPortBigButton), for: .touchUpInside)
    }
    
    
    @objc func didTapAnimalPortSmallButton() {
        self.delegate?.didTapAnimalPortSmallButton()
    }
    
    @objc func didTapAnimalPortMediumButton() {
        self.delegate?.didTapAnimalPortMediumButton()
    }
    
    @objc func didTapAnimalPortBigButton() {
        self.delegate?.didTapAnimalPortBigButton()
    }
}

