//
//  ResultSizeViewController.swift
//  CalculadorAreaApp
//
//  Created by Raphael Augusto on 03/11/22.
//

import UIKit

class ResultSizeViewController: UIViewController {

    //MARK: - Variable
    var resuts: String?
    
    //MARK: - Components View
    private lazy var resultSizeView: ResultSizeView = {
        let view = ResultSizeView()
        view.delegate = self
        
        return view
    }()
    
    
    //MARK: - life cycle
    override func loadView() {
        self.view = resultSizeView
    }
    
    init(resuts: String) {
        super.init(nibName: nil, bundle: nil)
        self.resuts   = resuts
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

}

extension ResultSizeViewController: ResultSizeViewProtocol {
    func didTapbackscreen() {
        print("VOLTAR")
        
        let homVC = HomeViewController()
        let navVC  = UINavigationController(rootViewController: homVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    func getData() {
        self.resultSizeView.showData(with: resuts ?? "0")
     }
}
