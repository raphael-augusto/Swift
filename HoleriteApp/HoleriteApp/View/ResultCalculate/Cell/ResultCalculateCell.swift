//
//  ResultCalculateCell.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 15/11/22.
//

import UIKit


final class  ResultCalculateCell : UITableViewCell {
    
    //MARK: - Identifier
    static let identifier:String = "ResultCalculateCell"
    
    
    //MARK: - ModelCell
    var viewModel: ResultCalculateCellViewModel?
    
    
    //MARK: - Properts
    private lazy var container: UIStackView = {
        let container = UIStackView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .center
        container.axis = .horizontal
        container.addArrangedSubview(stack)
        container.addArrangedSubview(valueLabel)
        
        return container
    }()
    
    private lazy var stack: UIStackView = {
        let container = UIStackView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .leading
        container.spacing = 5
        container.axis = .vertical
        container.addArrangedSubview(descriptionLabel)
        container.addArrangedSubview(percentageLabel)
        
        return container
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
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
}

//MARK: - Components and Constraints
extension ResultCalculateCell : ConfigurableView {
    
    func initSubviews() {
        addSubview(container)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}


//MARK: - Prepare Cell
extension ResultCalculateCell {
    
    public func setupCell(cell: Holeritedata, textColour:UIColor) {
        self.viewModel = ResultCalculateCellViewModel(objc: cell)

        if (viewModel?.value == "R$ 0,00" ) {
            self.valueLabel.textColor = .gray

        } else if (viewModel?.objc.isDiscount == false) {
            self.valueLabel.textColor = .systemGreen
            
        } else {
            self.valueLabel.textColor = .red
        }
        
        self.descriptionLabel.text  = self.viewModel?.name
        self.valueLabel.text        = self.viewModel?.value
        self.percentageLabel.text   = self.viewModel?.percentage
    }
}
