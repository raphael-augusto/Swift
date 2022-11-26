//
//  ResultAgeAnimalView.swift
//  AnimalAgeApp
//
//  Created by Raphael Augusto on 24/11/22.
//

import UIKit


final class ResultAgeAnimalView: UIView {
    
    //MARK: - Properts
    lazy var resultAgeHumanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    lazy var resultAgeAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    lazy var animalImage: UIImageView = {
        let image               = UIImageView()
        image.contentMode       = .scaleAspectFill
        image.backgroundColor   = .black
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
extension ResultAgeAnimalView : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(resultAgeHumanLabel)
        addSubview(resultAgeAnimalLabel)
        addSubview(animalImage)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            resultAgeHumanLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            resultAgeHumanLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            resultAgeAnimalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            resultAgeAnimalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            animalImage.topAnchor.constraint(equalTo: resultAgeAnimalLabel.bottomAnchor, constant: 20),
            animalImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            animalImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            animalImage.widthAnchor.constraint(equalToConstant: 280),
            animalImage.heightAnchor.constraint(equalToConstant: 280),
            
        ])
    }
}
