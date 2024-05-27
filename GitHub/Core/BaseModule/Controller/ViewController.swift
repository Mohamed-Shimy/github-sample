//
//  ViewController.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class ViewController<ViewModel, Item: Hashable>: UIViewController {
    
    // MARK: - UI
    
    var tableView: UITableView!
    
    // MARK: - Properties
    
    let viewModel: ViewModel
    var dataSource: UITableViewDiffableDataSource<Int, Item>!
    var cancellableBag = CancellableBag()
    
    // MARK: - init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        addTableView()
    }
    
    // MARK: - Setup
    
    func addTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }
    
    // MARK: - Methods
    
    func updateData(_ users: [Item]) {
        var snapshot = dataSource.snapshot()
        if snapshot.numberOfSections == 0 {
            snapshot.appendSections([0])
        }
        snapshot.appendItems(users, toSection: 0)
        dataSource.apply(snapshot)
    }
}
