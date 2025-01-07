//
//  CustomUIView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 6/1/25.
//

import UIKit

public class CustomUIView: UIView {

    public var likeButton = UIButton(type: .system)
    public var shareButton = UIButton(type: .system)
    public var commentButton = UIButton(type: .system)
    public var commentTextField = UITextField()

    public var onLike: (() -> Void)?
    public var onShare: (() -> Void)?
    public var onComment: ((_ text: String) -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 6

        likeButton.setTitle("Like", for: .normal)
        shareButton.setTitle("Share", for: .normal)
        commentButton.setTitle("Comment", for: .normal)

        likeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        commentButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)

        likeButton.tintColor = .systemGray
        shareButton.tintColor = .systemGray
        commentButton.tintColor = .systemGray
        
        likeButton.layer.borderWidth = 1
        shareButton.layer.borderWidth = 1
        commentButton.layer.borderWidth = 1
        
        likeButton.layer.borderColor = UIColor.systemGray.cgColor
        shareButton.layer.borderColor = UIColor.systemGray.cgColor
        commentButton.layer.borderColor = UIColor.systemGray.cgColor
        
        likeButton.layer.cornerRadius = 8
        shareButton.layer.cornerRadius = 8
        commentButton.layer.cornerRadius = 8

        commentTextField.placeholder = "Write a comment..."
        commentTextField.borderStyle = .roundedRect
        commentTextField.font = UIFont.systemFont(ofSize: 14)
        commentTextField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        commentTextField.returnKeyType = .done
        commentTextField.delegate = self

        let buttonStackView = UIStackView(arrangedSubviews: [likeButton, shareButton, commentButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually

        let mainStackView = UIStackView(arrangedSubviews: [buttonStackView, commentTextField])
        mainStackView.axis = .vertical
        mainStackView.spacing = 12
        mainStackView.alignment = .fill

        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])

        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentTapped), for: .touchUpInside)
    }

    @objc private func likeTapped() {
        onLike?()
    }

    @objc private func shareTapped() {
        onShare?()
    }

    @objc private func commentTapped() {
        guard let text = commentTextField.text, !text.isEmpty else { return }
        onComment?(text)
        commentTextField.text = ""
    }
}

// MARK: - UITextFieldDelegate
extension CustomUIView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            onComment?(text)
            textField.text = ""
        }
        return true
    }
}
