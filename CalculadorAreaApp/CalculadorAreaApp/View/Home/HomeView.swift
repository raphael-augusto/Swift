//
//  HomeView.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit


protocol HomeViewProtocol: AnyObject {
    func didTapCircle ()
    func didTapRectangle ()
    func didTapTriangle ()
}

final class HomeView: UIView {
    
    //MARK: - Delegate
    weak var delegate: HomeViewProtocol?
    
    
    //MARK: - Properts
    private lazy var selectTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha o formato"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    
    private lazy var circleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Circulo"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return label
    }()
    
    
    private lazy var  circleButton: UIButton = {
         let bt = UIButton()
         bt.translatesAutoresizingMaskIntoConstraints = false
         bt.backgroundColor = .systemBlue
         bt.setTitle("Ok", for: .normal)
         bt.layer.cornerRadius = 15
         
         return bt
     }()
    
    
    private lazy var rectangleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Retângulo"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return label
    }()
    
    
    private lazy var  rectangleButton: UIButton = {
         let bt = UIButton()
         bt.translatesAutoresizingMaskIntoConstraints = false
         bt.backgroundColor = .systemBlue
         bt.setTitle("Ok", for: .normal)
         bt.layer.cornerRadius = 15
         
         return bt
     }()
    
    
    private lazy var triangleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Triângulo"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        
        return label
    }()
    
    
    private lazy var  triangleButton: UIButton = {
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
}

//MARK: - Components and Constraints
extension HomeView : ConfigurableView {
    func initSubviews() {
        addSubview(selectTitle)
        addSubview(circleTitle)
        addSubview(circleButton)
        addSubview(rectangleTitle)
        addSubview(rectangleButton)
        addSubview(triangleTitle)
        addSubview(triangleButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            selectTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            selectTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            circleTitle.topAnchor.constraint(equalTo: selectTitle.bottomAnchor, constant: 80),
            circleTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            circleButton.topAnchor.constraint(equalTo: selectTitle.bottomAnchor, constant: 80),
            circleButton.leadingAnchor.constraint(equalTo: circleTitle.trailingAnchor, constant: 40),
            circleButton.widthAnchor.constraint(equalToConstant: 120),
            
            rectangleTitle.topAnchor.constraint(equalTo: circleTitle.bottomAnchor, constant: 80),
            rectangleTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            rectangleButton.topAnchor.constraint(equalTo: circleTitle.bottomAnchor, constant: 80),
            rectangleButton.leadingAnchor.constraint(equalTo: circleTitle.trailingAnchor, constant: 40),
            rectangleButton.widthAnchor.constraint(equalToConstant: 120),
            
            triangleTitle.topAnchor.constraint(equalTo: rectangleTitle.bottomAnchor, constant: 80),
            triangleTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            triangleButton.topAnchor.constraint(equalTo: rectangleTitle.bottomAnchor, constant: 80),
            triangleButton.leadingAnchor.constraint(equalTo: rectangleTitle.trailingAnchor, constant: 10),
            triangleButton.widthAnchor.constraint(equalToConstant: 120),

        ])
    }
    
    
}


//MARK: - Action
extension HomeView {
    func addTargets() {
        circleButton.addTarget(self, action: #selector(didTapCircle), for: .touchUpInside)
        rectangleButton.addTarget(self, action: #selector(didTapRectangle), for: .touchUpInside)
        triangleButton.addTarget(self, action: #selector(didTapTriangle), for: .touchUpInside)
    }
    
    
    @objc func didTapCircle() {
        delegate?.didTapCircle()
    }
    
    @objc func didTapRectangle() {
        delegate?.didTapRectangle()
    }
    
    @objc func didTapTriangle() {
        delegate?.didTapTriangle()
    }
    

}

