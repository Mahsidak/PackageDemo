//
//  LikeCommentShareStackView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 15/1/25.
//

import UIKit

class LikeCommentShareStackView: UIStackView {
    private lazy var likeButton: UIButton = createButton(imageName: "hand.thumbsup", title: " Like")
    private lazy var commentButton: UIButton = createButton(imageName: "text.bubble", title: " Comment")
    private lazy var shareButton: UIButton = createButton(imageName: "arrowshape.turn.up.forward", title: " Share")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addArrangedSubview(likeButton)
        addArrangedSubview(commentButton)
        addArrangedSubview(shareButton)
        backgroundColor = .clear
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createButton(imageName: String, title: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentHorizontalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
}
