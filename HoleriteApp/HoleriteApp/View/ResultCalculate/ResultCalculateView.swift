//
//  ResultCalculateView.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 15/11/22.
//

import UIKit

protocol ResultCalculateViewProtocol: AnyObject {
    func didTapBackScreen()
}

final class ResultCalculateView: UIView {
    
    //MARK: - Delegate
    weak var delegate: ResultCalculateViewProtocol?
    
    
    //MARK: - Properts
    private lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("FECHAR", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        bt.setTitleColor(.black, for: .normal)
        
        return bt
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ResultCalculateCell.self, forCellReuseIdentifier: ResultCalculateCell.identifier)
        
        return tableView
    }()
    
    
    //MARK: - Inits
    init(tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        super.init(frame: .zero)
        setup()
        
        loadResultCalculatetableView()
        
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        initView()
        initLayout()
        addTargets()
    }
    
    func loadResultCalculatetableView() {
        self.tableView.reloadData()
    }
}


//MARK: - Components and Constraints
extension ResultCalculateView : ConfigurableView {
    
    private func initView() {
        self.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    }
    
    func initSubviews() {
        addSubview(backButton)
        addSubview(tableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 80),
            
            
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}


//MARK: - Action
extension ResultCalculateView: ResultCalculateViewProtocol {
    
    private func addTargets() {
        backButton.addTarget(self, action: #selector(didTapBackScreen), for: .touchUpInside)
    }

    @objc func didTapBackScreen() {
        self.delegate?.didTapBackScreen()
    }
}

