//
//  HomeView.swift
//  AppClock
//
//  Created by Raphael Augusto on 06/11/22.
//

import UIKit



final class HomeView: UIView {
    
    
    //MARK: - Properts
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return lb
    }()
    
    
    public func renameTitle(with title: String, color: UIColor) {
        self.titleLabel.text = title
        self.titleLabel.textColor = color
    }
    
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
    }
}

//MARK: - Components and Constraints
extension HomeView : ConfigurableView {
    func initSubviews() {
        addSubview(titleLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
}
