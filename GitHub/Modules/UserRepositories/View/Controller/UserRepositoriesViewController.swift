//
//  UserRepositoriesViewController.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class UserRepositoriesViewController: ViewController<UserRepositoriesViewModelProtocol, Repository> {
    
    // MARK: - Properties
    
    private lazy var router = UserRepositoriesUIRouter(presenter: self)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(viewModel.user.name) Repositories"
        configureTableView()
        configureDataSource()
        setupObservers()
        viewModel.getRepositoriesList()
    }
    
    // MARK: - Setup
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.register(nib: RepositoryTableViewCell.self)
        tableView.estimatedRowHeight = 1
    }
    
    private func configureDataSource() {
        dataSource = .init(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, item: Repository) -> UITableViewCell? in
            let cell: RepositoryTableViewCell = tableView.dequeue()
            cell.configure(item)
            return cell
        }
    }
    
    private func setupObservers() {
        viewModel.repositories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] repositories in
                self?.updateData(repositories)
            }
            .store(in: &cancellableBag)
        
        viewModel.errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.showErrorAlert(message)
            }
            .store(in: &cancellableBag)
    }
    
    // MARK: - Methods
    
    private func openRepositoryForkers(_ repo: Repository) {
        router.navigate(to: .repositoryForkers)
    }
}

// MARK: - UITableViewDelegate

extension UserRepositoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repository = viewModel.getRepository(at: indexPath)
        openRepositoryForkers(repository)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
