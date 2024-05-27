//
//  RepositoryTableViewCell.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    // MARK: - Outlet
    
    @IBOutlet private weak var licenseContainerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var licenseLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Methods
    
    func configure(_ repo: Repository) {
        nameLabel.text = repo.name
        descriptionLabel.text = repo.description
        
        if let license = repo.license {
            licenseLabel.text = license.spdxId
            licenseContainerView.isHidden = false
        } else {
            licenseContainerView.isHidden = true
        }
    }
}
