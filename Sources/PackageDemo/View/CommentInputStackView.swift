//
//  CommentInputStackView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 15/1/25.
//

import UIKit

@MainActor
protocol CommentInputStackViewDelegate: AnyObject {
    func didTapSendButton(_ commentInputStackView: CommentInputStackView, withText text: String?)
}

class CommentInputStackView: UIStackView {
    private lazy var commentTextField = UITextField()
    private lazy var commentSendButton: UIButton = UIButton()
    weak var delegate: CommentInputStackViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        configureCommentTextField()
        configureCommentSendButton()
        addArrangedSubview(commentTextField)
        addArrangedSubview(commentSendButton)
        backgroundColor = .clear
        axis = .horizontal
        distribution = .fill
        alignment = .fill
        spacing = 5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCommentTextField() {
        commentTextField.placeholder = "Write a comment..."
        commentTextField.borderStyle = .none
        commentTextField.tintColor = .red
        commentTextField.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configureCommentSendButton() {
        commentSendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        commentSendButton.tintColor = .systemBlue
        commentSendButton.translatesAutoresizingMaskIntoConstraints = false
        commentSendButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        commentSendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc private func sendButtonTapped() {
        delegate?.didTapSendButton(self, withText: commentTextField.text)
    }

}
