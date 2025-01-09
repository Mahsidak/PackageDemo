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
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        if let view = UINib(nibName: "CustomUIView", bundle: bundle).instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
            setupView()
        }
    }

    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 6

        let bundle = Bundle.module
        
        configureButton(likeButton, title: "Like", imageName: "like-icon", bundle: bundle, tintColor: .systemOrange)
        configureButton(shareButton, title: "Share", imageName: "share-icon", bundle: bundle, tintColor: .systemOrange)
        configureButton(commentButton, title: "Comment", imageName: "comment-icon", bundle: bundle, tintColor: .systemOrange)
        
        commentTextField.placeholder = "Write a comment..."
        commentTextField.borderStyle = .roundedRect
        commentTextField.font = UIFont.systemFont(ofSize: 14)
        commentTextField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        commentTextField.returnKeyType = .done
        commentTextField.delegate = self

        let buttonStackView = UIStackView(arrangedSubviews: [likeButton, shareButton, commentButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 0
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillProportionally

        let mainStackView = UIStackView(arrangedSubviews: [buttonStackView, commentTextField])
        mainStackView.axis = .vertical
        mainStackView.spacing = 0
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

    /// Generic function to configure a UIButton
    private func configureButton(
        _ button: UIButton,
        title: String,
        imageName: String,
        bundle: Bundle,
        tintColor: UIColor
    ) {
        let resizedImage = UIImage(named: imageName, in: bundle, compatibleWith: nil)?
            .resized(to: CGSize(width: 24, height: 24))?
            .withColor(.systemGreen)
        button.setImage(resizedImage, for: .normal)
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.tintColor = tintColor

        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)

//        button.layer.borderColor = tintColor.cgColor
//        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true

    }

    @objc private func likeTapped() {
        onLike?()
    }

    @objc private func shareTapped() {
        let textToShare = "test text is sendable"
        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        if let viewController = self.viewController() {
            viewController.present(activityViewController, animated: true, completion: nil)
        }
    }

    @objc private func commentTapped() {
        guard let text = commentTextField.text, !text.isEmpty else { return }
        onComment?(text)
        commentTextField.text = ""
    }
    
    private func viewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
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
