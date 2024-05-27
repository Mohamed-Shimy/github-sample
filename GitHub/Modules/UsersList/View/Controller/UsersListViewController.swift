//
//  UsersListViewController.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit
import Combine

class UsersListViewController: ViewController<UsersListViewModelProtocol, User> {
    
    // MARK: - Properties
    
    private lazy var router = UsersListUIRouter(presenter: self)
    
    // MARK: - LifeCycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        configureTableView()
        configureDataSource()
        setupObservers()
        viewModel.getUsersList()
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
        viewModel.usersLastPage
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
        router.navigate(to: .userRepositories)
    }
}

// MARK: - UITableViewDelegate

extension UsersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.getUser(at: indexPath)
        openUserRepositories(user)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        guard contentHeight > 0 else { return }

        let yOffset = scrollView.contentOffset.y
        let viewHeight = view.frame.height
        let currentY = yOffset + viewHeight
        let hitRatio: CGFloat = 0.75
        
        if currentY > (contentHeight * hitRatio) {
            viewModel.getNextPage()
        }
    }
}
