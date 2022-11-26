//
//  HomeView.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 23/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func suitDidChange(_ segmentedControl: UISegmentedControl)
    func calculateDidButton()
}


final class HomeView: UIView {
    
    //MARK: - Delegate
    weak var delegate: HomeViewProtocol?
    
    
    //MARK: - Properts
   
    private lazy var ageAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Informe o ano de nascimento:"
        
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
        tf.attributedPlaceholder = NSAttributedString(string: "Ano", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
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
        
    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["Pequeno","Médio","Grande"]
        let segment = UISegmentedControl(items: items)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        
        return segment
    }()
    
    
    
    private lazy var calculateButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("Calcular", for: .normal)
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
        addSubview(segmentedControl)
        addSubview(calculateButton)
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
            
            
            segmentedControl.topAnchor.constraint(equalTo: sizeOfTheAnimalLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}


//MARK: - Action
extension HomeView: HomeViewProtocol {
    
    private func addTargets() {
        segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateDidButton), for: .touchUpInside)
    }
    
    
    
    @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
        self.delegate?.suitDidChange(segmentedControl)
    }
    
    @objc func calculateDidButton() {
        self.delegate?.calculateDidButton()
    }
}

