//
//  ImageView+LoadImage.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

extension UIImageView {
    
    func loadImage(url string: String, placeholder: UIImage? = nil) {
        guard !string.isEmpty,
            let url = URL(string: string)
        else {
            image = placeholder
            return
        }
        
        UIImageLoader.shared.load(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image ?? placeholder
            }
        }
    }
}
