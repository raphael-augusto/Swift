//
//  CarView.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 20/12/22.
//

import UIKit

protocol CarViewDelegate: AnyObject {
    func didTapScreen ()
}


final class CarView: UIView {
    
    //MARK: - Delegate
    weak var delegate: CarViewDelegate?
    
    
    //MARK: - Properts
    private lazy var plateCarLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Informe a sua placa"
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return lb
    }()
    
    
    lazy var plateCarTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.font = .systemFont(ofSize: 24)
        tf.keyboardType = .default
        tf.autocapitalizationType = .allCharacters
        tf.textAlignment = .left
        tf.textColor = .black
        tf.clearButtonMode = .whileEditing
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua placa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        tf.addPadding(.left(8))
        
        
        return tf
    }()
    
    private lazy var carImage: UIImageView = {
        let carImage  = UIImage(named: "car")
        let image               = UIImageView(image: carImage)
        image.contentMode       = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    private lazy var goButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor(red: 80/255, green: 166/255, blue: 242/255, alpha: 1)
        bt.setTitle("Go", for: .normal)
        bt.layer.cornerRadius = 10
        
        bt.addTarget(self, action: #selector(didTapScreen), for: .touchUpInside)

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
    
    public func clearTextField() {
        self.plateCarTextField.text = ""
    }
}

//MARK: - Components and Constraints
extension CarView : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(plateCarLabel)
        addSubview(plateCarTextField)
        addSubview(carImage)
        addSubview(goButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            plateCarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            plateCarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            plateCarTextField.topAnchor.constraint(equalTo: plateCarLabel.bottomAnchor, constant: 20),
            plateCarTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            plateCarTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            plateCarTextField.heightAnchor.constraint(equalToConstant: 42),
            
            carImage.topAnchor.constraint(equalTo: plateCarTextField.bottomAnchor, constant: 40),
            carImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            carImage.heightAnchor.constraint(equalToConstant: 380),
            carImage.widthAnchor.constraint(equalToConstant: 380),
            
            goButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            goButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            goButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            goButton.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    
}


//MARK: - Action
extension CarView: CarViewDelegate {
    
    @objc func didTapScreen() {
        self.delegate?.didTapScreen()
    }
}

