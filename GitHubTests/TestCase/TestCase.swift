//
//  TestCase.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import XCTest
@testable import GitHub

class TestCase<ViewModel>: XCTestCase {
    
    var viewModel: ViewModel!
    var cancellableBag: CancellableBag!
    
    override func tearDownWithError() throws {
        viewModel = nil
        cancellableBag = nil
    }
}
