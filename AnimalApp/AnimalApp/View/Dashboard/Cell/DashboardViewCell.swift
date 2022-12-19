//
//  DashboardViewCell.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 29/11/22.
//

import UIKit


final class DashboardViewCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier:String = "DashboardViewCell"
        
    
    //MARK: - Properts
    lazy var nameTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        initLayout()
    }
    
    
    //MARK: - Setup Cell
    public func setupCell(cell: String) {
        self.nameTitle.text  = cell
    }
}


//MARK: - Components and Constraints
extension DashboardViewCell : ConfigurableView {
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(nameTitle)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

        ])
    }
}
