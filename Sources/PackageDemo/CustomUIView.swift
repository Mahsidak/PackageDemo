//
//  CustomUIView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 6/1/25.
//

import UIKit

@available(iOS 13.0, *)
public class CustomUIView: UIView {
    // MARK: - UI Elements
    private lazy var likeButton: UIButton = createButton(imageName: "hand.thumbsup", title: " Like")
    private lazy var commentButton: UIButton = createButton(imageName: "text.bubble", title: " Comment")
    private lazy var shareButton: UIButton = createButton(imageName: "arrowshape.turn.up.forward", title: " Share")
    
    private lazy var commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write a comment..."
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isHidden = true
        return textField
    }()
    
    private lazy var commentSendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .systemBlue
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private lazy var commentTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupActions()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "CommentTableViewCell")
        commentTableView.delegate = self
        commentTableView.dataSource = self
        print("Separator Style: \(commentTableView.separatorStyle)")
        
        let buttonStackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .fill
        
//        let commentStackView = UIStackView(arrangedSubviews: [commentTextField, commentSendButton])
//        commentStackView.axis = .horizontal
//        commentStackView.distribution = .fill
//        commentStackView.alignment = .fill
//        commentStackView.spacing = 5
        addSubview(buttonStackView)
//        addSubview(commentStackView)
        addSubview(commentTableView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
//        commentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            commentTableView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            commentTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            commentStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
//            commentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
//            commentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            commentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
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
    
    //MARK: Configure Actions
    private func setupActions() {
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        commentSendButton.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
    }
    
    @objc private func likeButtonTapped() {
        print("Like button tapped")
    }
    
    @objc private func commentButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let isHidden = self.commentTextField.isHidden
            self.commentTextField.isHidden = !isHidden
            self.commentSendButton.isHidden = !isHidden
        }
    }
    
    @objc private func shareButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let textToShare = "Share button tapped!"
            let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            if let viewController = self.viewController() {
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    @objc private func sendComment() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let text = self.commentTextField.text, !text.isEmpty else { return }
            print("Comment sent: \(text)")
            self.commentTextField.text = ""
        }
    }
}

@available(iOS 13.0, *)
extension CustomUIView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else {
            print("can't find CommentTableViewCell")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(profileImage: nil, profileName: "Steve Rogers", commentText: "This pack is great! fr")
        return cell
    }

}

// MARK: - UITextFieldDelegate
@available(iOS 13.0, *)
extension CustomUIView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DispatchQueue.main.async {
            textField.resignFirstResponder()
            if let text = textField.text, !text.isEmpty {
                textField.text = ""
            }
        }
        return true
    }
}
