//
//  Combine+typealias.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Combine

typealias PassSubject<Value> = PassthroughSubject<Value, Never>
typealias ValueSubject<Value> = CurrentValueSubject<Value, Never>
typealias NeverPublisher<Output> = AnyPublisher<Output, Never>

typealias CancellableBag = Set<AnyCancellable>
