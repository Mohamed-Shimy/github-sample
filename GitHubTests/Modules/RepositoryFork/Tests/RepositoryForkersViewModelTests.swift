//
//  RepositoryForkersViewModelTests.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import XCTest
@testable import GitHub

class RepositoryForkersViewModelTests: TestCase<RepositoryForkersViewModelProtocol> {
    
    override func setUpWithError() throws {
        let forkRepository = RepositoryForkRepository(manager: MockNetworkManager())
        let repoResponse: RepositoryResponse = try! JSONLoader.load(name: "defunkt-dotjs")
        let repo = Repository(response: repoResponse)!
        
        viewModel = RepositoryForkersViewModel(
            repository: repo,
            forkRepository: forkRepository
        )
        
        cancellableBag = []
    }
    
    func testGetRepositoriesList() throws {
        let expectation = expectation(description: "testGetRepositoriesList")
        observeOnError(expectation: expectation)
        
        viewModel.forkers
            .dropFirst()
            .sink { users in
                XCTAssertTrue(users.count == 100)
                expectation.fulfill()
            }
            .store(in: &cancellableBag)
        
        viewModel.getForkersList()
        
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
