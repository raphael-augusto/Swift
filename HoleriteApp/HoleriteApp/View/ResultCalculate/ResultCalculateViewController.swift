//
//  ResultCalculateViewController.swift
//  HoleriteApp
//
//  Created by Raphael Augusto on 15/11/22.
//

import UIKit

class ResultCalculateViewController: UIViewController {
    
    //MARK: - ViewModel
    private var viewModel = ResultCalculateViewModel()
    
    
    //MARK: - Variables
    private var grossSalary: String?
    private var discount: String?
    
    
    //MARK: - Properts
    private lazy var resultContainer: ResultCalculateView = {
        let view =  ResultCalculateView(tableViewDataSource: self, tableViewDelegate: self)
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - Life cycle
    override func loadView() {
        self.view = resultContainer
    }
    
    
    init(grossSalary: String, discount: String) {
        super.init(nibName: nil, bundle: nil)
        self.grossSalary = grossSalary
        self.discount = discount
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
          
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.getData(salary: self.grossSalary ?? "0", discount: self.discount ?? "0")
    }
}


//MARK: - TableView
extension ResultCalculateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataHolerite.result.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCalculateCell.identifier, for: indexPath) as? ResultCalculateCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.setupCell(cell: self.viewModel.getIndex(indexPath: indexPath), textColour: .red)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


//MARK: - Action
extension ResultCalculateViewController: ResultCalculateViewProtocol {
    
    func didTapBackScreen() {
        print("Voltar -> HomeVC")
        self.dismiss(animated: true,completion: nil)
    }
}
