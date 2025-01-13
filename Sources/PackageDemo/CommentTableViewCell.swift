//
//  CommentTableViewCell.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import UIKit

@available(iOS 13.0, *)
class CommentTableViewCell: UITableViewCell {
    
    private lazy var mainView = UIView()
    private lazy var profilePictureImageView = UIImageView()
    private lazy var commentHolderView = UIView()
    private lazy var profileNameLabel = UILabel()
    private lazy var commentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor.clear
        self.separatorInset = UIEdgeInsets(top: 0, left: contentView.bounds.size.width, bottom: 0, right: 0)
        mainView.backgroundColor = UIColor.systemBackground
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.clipsToBounds = true
        contentView.addSubview(mainView)

        profilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureImageView.contentMode = .scaleAspectFit
        profilePictureImageView.clipsToBounds = true
        mainView.addSubview(profilePictureImageView)
        
        commentHolderView.translatesAutoresizingMaskIntoConstraints = false
        commentHolderView.backgroundColor = UIColor.systemGray3
        mainView.addSubview(commentHolderView)
        
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        profileNameLabel.numberOfLines = 1
        commentHolderView.addSubview(profileNameLabel)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.numberOfLines = 0
        commentHolderView.addSubview(commentLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profilePictureImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            profilePictureImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            profilePictureImageView.widthAnchor.constraint(equalToConstant: 50),
            profilePictureImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            commentHolderView.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 5),
            commentHolderView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            commentHolderView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            commentHolderView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: commentHolderView.leadingAnchor, constant: 7),
            profileNameLabel.topAnchor.constraint(equalTo: commentHolderView.topAnchor, constant: 7),
            profileNameLabel.trailingAnchor.constraint(equalTo: commentHolderView.trailingAnchor, constant: -7)
        ])
        
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor),
            commentLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 3),
            commentLabel.trailingAnchor.constraint(equalTo: profileNameLabel.trailingAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: commentHolderView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(profileImage: UIImage?, profileName: String, commentText: String) {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
        commentHolderView.layer.cornerRadius = 10
        profilePictureImageView.image = profileImage
        profileNameLabel.text = profileName
        commentLabel.text = commentText
    }
}
