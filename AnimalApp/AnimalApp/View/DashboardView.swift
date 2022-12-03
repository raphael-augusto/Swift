//
//  DashBoardView.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 29/11/22.
//

import UIKit


final class DashboardView: UIView {
    
    
    //MARK: - Properts
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DashboardViewCell.self, forCellReuseIdentifier: DashboardViewCell.identifier)
        
        return tableView
    }()
    
    
    //MARK: - Inits
    init(tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        super.init(frame: .zero)
        setup()
        
        loadResultTableView()
        
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        initLayout()
    }
    
    
    func loadResultTableView() {
        self.tableView.reloadData()
    }
}

//MARK: - Components and Constraints
extension DashboardView: ConfigurableView {
    
    func initView() {
        backgroundColor = .white
    }
    
    func initSubviews() {
        addSubview(tableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

