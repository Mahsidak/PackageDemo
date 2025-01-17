//
//  CommentTableViewCell.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import UIKit

@available(iOS 13.0, *)
class CommentTableViewCell: UITableViewCell {
    //MARK: Variables
    private lazy var mainView = UIView()
    private lazy var profilePictureImageView = UIImageView()
    private lazy var commentHolderView = UIView()
    private lazy var profileNameLabel = UILabel()
    private lazy var commentLabel = UILabel()
    
    //MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configure(profileImage: UIImage?, profileName: String, commentText: String) {
        profilePictureImageView.image = profileImage
        profileNameLabel.text = profileName
        commentLabel.text = commentText
    }
    
    //MARK: Setup View
    private func setupView() {
        self.backgroundColor = .clear
        configureContentView()
        configureMainView()
        configureProfilePictureImageView()
        configureCommentHolderView()
        configureProfileNameLabel()
        configureCommentLabel()
    }

    private func configureContentView() {
        contentView.backgroundColor = .clear
        contentView.layoutIfNeeded()
        separatorInset = UIEdgeInsets(top: 0, left: contentView.bounds.width * 2, bottom: 0, right: 0)
    }

    private func configureMainView() {
        mainView.addSubview(profilePictureImageView)
        mainView.addSubview(commentHolderView)
        mainView.backgroundColor = .clear
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.clipsToBounds = true
        
        contentView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func configureProfilePictureImageView() {
        profilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureImageView.contentMode = .scaleAspectFill
        profilePictureImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            profilePictureImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            profilePictureImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            profilePictureImageView.widthAnchor.constraint(equalToConstant: 30),
            profilePictureImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        profilePictureImageView.layoutIfNeeded()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.height / 2
    }

    private func configureCommentHolderView() {
        commentHolderView.addSubview(profileNameLabel)
        commentHolderView.addSubview(commentLabel)
        
        commentHolderView.translatesAutoresizingMaskIntoConstraints = false
        commentHolderView.backgroundColor = .systemGray5
        commentHolderView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            commentHolderView.leadingAnchor.constraint(equalTo: profilePictureImageView.trailingAnchor, constant: 5),
            commentHolderView.topAnchor.constraint(equalTo: profilePictureImageView.topAnchor),
            commentHolderView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            commentHolderView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5)
        ])
    }

    private func configureProfileNameLabel() {
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        profileNameLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: commentHolderView.leadingAnchor, constant: 7),
            profileNameLabel.topAnchor.constraint(equalTo: commentHolderView.topAnchor, constant: 7),
            profileNameLabel.trailingAnchor.constraint(equalTo: commentHolderView.trailingAnchor, constant: -7)
        ])
    }

    private func configureCommentLabel() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor),
            commentLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 3),
            commentLabel.trailingAnchor.constraint(equalTo: profileNameLabel.trailingAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: commentHolderView.bottomAnchor, constant: -10)
        ])
    }
    
}
