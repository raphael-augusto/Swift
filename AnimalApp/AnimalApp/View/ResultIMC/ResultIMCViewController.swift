//
//  ResultIMCViewController.swift
//  AnimalApp
//
//  Created by Raphael Augusto on 06/12/22.
//

import UIKit

class ResultIMCViewController: UIViewController {

    //MARK: - ViewModel
    private var resultIMCViewModel = ResultIMCViewModel()
    
    
    //MARK: - Variables
    private var weight: String?
    private var height: String?
    
    
    //MARK: - Properts
    private lazy var resultIMCView: ResultIMCView = {
        let view = ResultIMCView()
        view.delegate = self

        return view
    }()
    
    
    //MARK: - Life Cycle
    init(weight: String, height: String) {
        super.init(nibName: nil, bundle: nil)
        self.weight = weight
        self.height = height
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = resultIMCView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showResult()
    }
    
    
    func showResult() {
        let dataValue = resultIMCViewModel.resultIMC(weight: weight ?? "0", height: height ?? "0")
        let descriptionValue = resultIMCViewModel.calculate()

        
        resultIMCView.resultDescription.text = "Descrição: \(descriptionValue)"
        resultIMCView.resultValue.text = "Valor calculado: \(dataValue)"
        resultIMCView.resultImage.image = UIImage(named: descriptionValue)
    }
}

extension ResultIMCViewController: ResultIMCViewDelegate{
    func backScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func closeScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
