//
//  RepositoryForkersViewController.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class RepositoryForkersViewController: ViewController<RepositoryForkersViewModelProtocol, User> {
    
    // MARK: - Properties
    
    private lazy var router = UsersListUIRouter(presenter: self)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(viewModel.repository.name) Forkers"
        configureTableView()
        configureDataSource()
        setupObservers()
        viewModel.getForkersList()
    }
    
    // MARK: - Setup
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.register(nib: UserTableViewCell.self)
        tableView.rowHeight = 70
    }
    
    private func configureDataSource() {
        dataSource = .init(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, item: User) -> UITableViewCell? in
            let cell: UserTableViewCell = tableView.dequeue()
            cell.configure(item)
            return cell
        }
    }
    
    private func setupObservers() {
        viewModel.forkers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] users in
                self?.updateData(users)
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
    
    private func openUserRepositories(_ user: User) {
        let viewModel = UserRepositoriesViewModel(user: user)
        router.navigate(to: .userRepositories(viewModel))
    }
}

// MARK: - UITableViewDelegate

extension RepositoryForkersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let forker = viewModel.getForker(at: indexPath)
        openUserRepositories(forker)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
