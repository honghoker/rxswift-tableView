//  CellIdentifierViewController.swift

import UIKit
import RxSwift
import RxCocoa

class CellIdentifierViewController: UIViewController {
    var dataSource = Observable.of((1...30).map(String.init))
    var disposeBag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBindTableView()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupBindTableView() {
        dataSource
            .bind(to: tableView.rx.items(cellIdentifier: MyTableViewCell.identifier)) { (index: Int, item: String, cell: UITableViewCell) -> Void in
                let cell = cell as! MyTableViewCell
                cell.bind(text: item)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
//        DataType 생략 가능
//        dataSource
//            .bind(to: tableView.rx.items(cellIdentifier: MyTableViewCell.identifier)) { (index, item, cell) in
//                let cell = cell as! MyTableViewCell
//                cell.bind(text: item)
//                cell.selectionStyle = .none
//            }
//            .disposed(by: disposeBag)
    }
}
