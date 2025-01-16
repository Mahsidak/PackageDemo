//
//  LikeCommentShareStackView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 15/1/25.
//

import UIKit

@MainActor
protocol LikeCommentShareStackViewDelegate: AnyObject {
    func didTapLike(_ stackView: LikeCommentShareStackView)
    func didTapComment(_ stackView: LikeCommentShareStackView)
    func didTapShare(_ stackView: LikeCommentShareStackView)
}

class LikeCommentShareStackView: UIStackView {
    private lazy var likeButton: UIButton = createButton(imageName: "hand.thumbsup", title: " Like", action: #selector(didTapLikeButton))
    private lazy var commentButton: UIButton = createButton(imageName: "text.bubble", title: " Comment", action: #selector(didTapCommentButton))
    private lazy var shareButton: UIButton = createButton(imageName: "arrowshape.turn.up.forward", title: " Share", action: #selector(didTapShareButton))
    
    weak var delegate: LikeCommentShareStackViewDelegate?
    
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
    
    private func createButton(imageName: String, title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentHorizontalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: action, for: .touchUpInside)
        
        return button
    }
    
    @objc private func didTapLikeButton() {
        delegate?.didTapLike(self)
    }
    
    @objc private func didTapCommentButton() {
        delegate?.didTapComment(self)
    }
    
    @objc private func didTapShareButton() {
        delegate?.didTapShare(self)
    }
    
}
