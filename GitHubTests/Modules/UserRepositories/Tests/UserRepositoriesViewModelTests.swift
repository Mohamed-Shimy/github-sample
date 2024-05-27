//
//  UserRepositoriesViewModelTests.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import XCTest
@testable import GitHub

final class UserRepositoriesViewModelTests: TestCase<UserRepositoriesViewModelProtocol> {
 
    override func setUpWithError() throws {
        let repositoriesRepo = UserRepositoriesRepository(manager: MockNetworkManager())
        let userResponse: UserResponse = try! JSONLoader.load(name: "defunkt")
        let user = User(response: userResponse)!
        
        viewModel = UserRepositoriesViewModel(
            user: user,
            repositoriesRepo: repositoriesRepo
        )
        
        cancellableBag = []
    }

    func testGetRepositoriesList() throws {
        let expectation = expectation(description: "testGetRepositoriesList")
        observeOnError(expectation: expectation)
        
        viewModel.repositories
            .dropFirst()
            .sink { repositories in
                for repo in repositories {
                    XCTAssertTrue(
                        repo.owner == self.viewModel.user,
                        "\(repo.owner.name) is not the owner of \(repo.name) repo"
                    )
                }
                
                expectation.fulfill()
            }
            .store(in: &cancellableBag)
        
        viewModel.getRepositoriesList()
        
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
