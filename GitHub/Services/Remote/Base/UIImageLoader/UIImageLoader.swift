//
//  UIImageLoader.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit
import Foundation

class UIImageLoader {
    
    static let shared = UIImageLoader()
    
    private let cache = UIImageCache.open
    
    private init() { }
    
    func load(
        from url: URL,
        completion: @escaping (UIImage?) -> Void
    ) {
        if let image = cache[url] {
            completion(image)
        }
        
        loadImageAsync(from: url) { [weak self] image in
            if let image {
                self?.cache[url] = image
            }
            completion(image)
        }
    }
    
    private func loadImageAsync(
        from url: URL,
        completion: @escaping (UIImage?) -> Void
    ) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
}
