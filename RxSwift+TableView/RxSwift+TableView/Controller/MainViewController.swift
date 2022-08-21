//
//  MainViewController.swift
//  RxSwift+TableView
//
//  Created by 홍은표 on 2022/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    lazy var noneParameterButton: UIButton = {
        var configuration = UIButton.Configuration.gray()
        configuration.title = "None"
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = .systemBlue
        configuration.buttonSize = .large
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var cellIdentifierButton: UIButton = {
        var configuration = UIButton.Configuration.gray()
        configuration.title = "CellIdentifier"
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = .systemBlue
        configuration.buttonSize = .large
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var cellIdentifierAndCellTypeButton: UIButton = {
        var configuration = UIButton.Configuration.gray()
        configuration.title = "CellIdentifier&CellType"
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = .systemBlue
        configuration.buttonSize = .large
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBind()
    }
    
    func setupLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(noneParameterButton)
        self.view.addSubview(cellIdentifierButton)
        self.view.addSubview(cellIdentifierAndCellTypeButton)
        
        NSLayoutConstraint.activate([
            noneParameterButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            noneParameterButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
            cellIdentifierButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            cellIdentifierButton.topAnchor.constraint(equalTo: self.noneParameterButton.bottomAnchor, constant: 50),
            cellIdentifierAndCellTypeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            cellIdentifierAndCellTypeButton.topAnchor.constraint(equalTo: self.cellIdentifierButton.bottomAnchor, constant: 50),
        ])
    }
    
    func setupBind() {
        noneParameterButton.rx.tap
            .bind { [weak self] _ in
                let vc = NoneParameterViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        cellIdentifierButton.rx.tap
            .bind { [weak self] in
                let vc = CellIdentifierViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        cellIdentifierAndCellTypeButton.rx.tap
            .bind { [weak self] in
                let vc = CellIdentifierAndCellTypeViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

