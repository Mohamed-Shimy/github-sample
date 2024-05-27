//
//  UsersViewModelTests.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import XCTest
@testable import GitHub

final class UsersViewModelTests: TestCase<UsersListViewModelProtocol> {
    
    private var pageSize = 30

    override func setUpWithError() throws {
        let usersRepo = UsersRepository(
            manager: MockNetworkManager(),
            pageSize: pageSize
        )
        viewModel = UsersListViewModel(usersRepo: usersRepo)
        cancellableBag = []
    }

    func testGetUsersList() throws {
        let expectation = expectation(description: "testGetUsersList")
        observeOnError(expectation: expectation)
        
        viewModel.usersLastPage
            .sink { users in
                XCTAssertTrue(users.count == self.pageSize)
                expectation.fulfill()
            }
            .store(in: &cancellableBag)
        
        viewModel.getUsersList()
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetNextPage() {
        let expectation = expectation(description: "testGetNextPage")
        observeOnError(expectation: expectation)
        
        viewModel.usersLastPage
            .dropFirst()
            .sink { users in
                XCTAssertTrue(users.count == self.pageSize)
                expectation.fulfill()
            }
            .store(in: &cancellableBag)
        
        viewModel.getUsersList()
        viewModel.getNextPage()
        
        waitForExpectations(timeout: 5)
    }
    
    private func observeOnError(expectation: XCTestExpectation) {
        viewModel.errorMessage.sink { message in
            XCTFail(message)
            expectation.fulfill()
        }
        .store(in: &cancellableBag)
    }
}
