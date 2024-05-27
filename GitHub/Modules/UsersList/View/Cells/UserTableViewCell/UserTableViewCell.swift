//
//  UserTableViewCell.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var repositoriesCountLabel: UILabel!
    @IBOutlet private var followersCountLabel: UILabel!
    
    // MARK: - Methods
    
    func configure(_ user: User) {
        userNameLabel.text = user.name
        repositoriesCountLabel.text = "\(user.publicRepos)"
        followersCountLabel.text = "\(user.followers)"
    }
}
