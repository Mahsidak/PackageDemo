//
//  CountView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 15/1/25.
//

import UIKit

class CountView: UIView {
    private lazy var likeCountLabel = createLabel(text: "300k Likes")
    private lazy var commentCountLabel = createLabel(text: "1.9k Comments")
    private lazy var shareCountLabel = createLabel(text: "879 Shares")
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(likeCountLabel)
        self.addSubview(commentCountLabel)
        self.addSubview(shareCountLabel)
        
        NSLayoutConstraint.activate([
            likeCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            commentCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            shareCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            shareCountLabel.leadingAnchor.constraint(equalTo: commentCountLabel.trailingAnchor, constant: 15),
            shareCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
        ])
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }
    
}
