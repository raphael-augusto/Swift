//
//  DashboardViewController.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 29/11/22.
//

import UIKit

class DashboardViewController: UIViewController {
 
    //MARK: - ViewModel
    private var dashboardViewModel = DashboardViewModel()

    
    //MARK: - Variables
    private var alert: Alert?
    
    
    //MARK: - Properts
    private lazy var dashBoardView: DashboardView = {
        let view = DashboardView(tableViewDataSource: self, tableViewDelegate: self)
        
        return view
    }()
    
    
    //MARK: - Life cycle
    override func loadView() {
        self.view = dashBoardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert = Alert(controller: self)
    }
    
}


//MARK: - TableView
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dashboardViewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardViewCell.identifier, for: indexPath) as? DashboardViewCell else { return UITableViewCell() }
    
        cell.setupCell(cell: self.dashboardViewModel.getNames(indexPath: indexPath).descriptionName.orEmpty)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataIndexPath = self.dashboardViewModel.getNames(indexPath: indexPath).descriptionName else { return }
        
        if dataIndexPath == IMCData().descriptionName {
            let homeIMC = HomeIMCViewController()
            self.navigationController?.pushViewController(homeIMC, animated: true)

        } else if dataIndexPath == CarModel().descriptionName {
            let car = CarViewController()
            self.navigationController?.pushViewController(car, animated: true)

        } else {
            self.alert?.getAlert(title: "Atenção", message: "Nome da raça selecionada é: \(dataIndexPath)")
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
