//
//  UIView.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

extension UIView {
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: "\(self)",bundle : nil) }
}
