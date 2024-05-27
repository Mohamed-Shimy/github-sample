//
//  UITableView+RegisterDequeue.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(nib cell: Cell.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(withIdentifier: id) as? Cell else {
            fatalError("Cannot dequeue cell with identifier '\(id)'")
        }
        return cell
    }
}
