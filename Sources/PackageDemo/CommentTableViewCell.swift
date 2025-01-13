//
//  CommentTableViewCell.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    // UI Elements
    let profilePictureImageView = UIImageView()
    let commentHolderView = UIView()
    let profileNameLabel = UILabel()
    let commentLabel = UILabel()

    // Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Set the profile picture image view
        profilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureImageView.contentMode = .scaleAspectFit
        profilePictureImageView.clipsToBounds = true
        contentView.addSubview(profilePictureImageView)
        
        // Set the comment holder view
        commentHolderView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            commentHolderView.backgroundColor = UIColor.systemGray3
        } else {
            // Fallback on earlier versions
        }
        contentView.addSubview(commentHolderView)
        
        // Set the profile name label
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        profileNameLabel.numberOfLines = 1
        commentHolderView.addSubview(profileNameLabel)
        
        // Set the comment label
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.numberOfLines = 0
        commentHolderView.addSubview(commentLabel)
        
        // Set up constraints
        setupConstraints()
    }
    
    private func setupConstraints() {
        // Profile Picture Image View Constraints
        NSLayoutConstraint.activate([
            profilePictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profilePictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            profilePictureImageView.widthAnchor.constraint(equalToConstant: 24),
            profilePictureImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // Comment Holder View Constraints
        NSLayoutConstraint.activate([
            commentHolderView.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 5),
            commentHolderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            commentHolderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            commentHolderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        // Profile Name Label Constraints
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: commentHolderView.leadingAnchor, constant: 5),
            profileNameLabel.topAnchor.constraint(equalTo: commentHolderView.topAnchor, constant: 7),
            profileNameLabel.trailingAnchor.constraint(equalTo: commentHolderView.trailingAnchor, constant: -5)
        ])
        
        // Comment Label Constraints
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor),
            commentLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 3),
            commentLabel.trailingAnchor.constraint(equalTo: profileNameLabel.trailingAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: commentHolderView.bottomAnchor, constant: -10)
        ])
    }
    
    // Configure the cell with data
    func configure(profileImage: UIImage?, profileName: String, commentText: String) {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
        commentHolderView.layer.cornerRadius = 10
        profilePictureImageView.image = profileImage
        profileNameLabel.text = profileName
        commentLabel.text = commentText
    }
}
