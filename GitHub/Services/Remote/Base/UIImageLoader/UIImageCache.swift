//
//  UIImageCache.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation
import UIKit

final class UIImageCache {
    
    static let open = UIImageCache()
    
    private let locker = NSLock()
    
    private let cache: NSCache<NSURL, UIImage> = {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 1000
        cache.totalCostLimit = 1024 * 1024 // 1 MB
        return cache
    }()
    
    private init() { }
    
    subscript(_ key: URL) -> UIImage? {
        get {
            locker.lock()
            defer { locker.unlock() }
            return cache.object(forKey: key as NSURL)
        }
        set {
            locker.lock()
            defer { locker.unlock() }
            if newValue == nil {
                cache.removeObject(forKey: key as NSURL)
            } else {
                cache.setObject(newValue!, forKey: key as NSURL)
            }
        }
    }
}
