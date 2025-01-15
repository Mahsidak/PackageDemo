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
    private lazy var buttonStackView = LikeCommentShareStackView()
    private lazy var commentTableView: UITableView = UITableView()
    private lazy var commentTextField = UITextField()
    private lazy var commentSendButton: UIButton = UIButton()
    private lazy var commentInputStackView = UIStackView()
    private lazy var countView = CountView()
    
    private var comments = [["Steve Rogers": "What a pack!!"],["Tony Stark": "good good good good good good good good good good good good good good good good good good good good"],["Dr Bruce": "Hes lost fr"],["Clint Barton": "I got this pack. speed was okayish"],["Natasha Romarof": "Man! Everytime i browse google it slows down for me. idk why"]]
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupActions()
    }
    
    // MARK: - Setup View
    private func setupView() {
        addSubview(countView)
        addSubview(buttonStackView)
        addSubview(commentTableView)
        addSubview(commentInputStackView)
        
        configureCountView()
        configureButtonStackView()
        configureCommentTableView()
        configureCommentInputStackView()
    }
    
    private func configureCountView() {
        NSLayoutConstraint.activate([
            countView.topAnchor.constraint(equalTo: topAnchor),
            countView.leadingAnchor.constraint(equalTo: leadingAnchor),
            countView.trailingAnchor.constraint(equalTo: trailingAnchor),
            countView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func configureButtonStackView() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: countView.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureCommentTableView() {
        commentTableView.backgroundColor = .clear
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "CommentTableViewCell")
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            commentTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: commentInputStackView.topAnchor),
        ])
    }
    
    private func configureCommentTextField() {
        commentTextField.placeholder = "Write a comment..."
        commentTextField.borderStyle = .none
        commentTextField.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configureCommentSendButton() {
        commentSendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        commentSendButton.tintColor = .systemBlue
        commentSendButton.translatesAutoresizingMaskIntoConstraints = false
        commentSendButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureCommentInputStackView() {
        configureCommentTextField()
        configureCommentSendButton()
        commentInputStackView.addArrangedSubview(commentTextField)
        commentInputStackView.addArrangedSubview(commentSendButton)
        commentInputStackView.axis = .horizontal
        commentInputStackView.distribution = .fill
        commentInputStackView.alignment = .fill
        commentInputStackView.spacing = 5
        commentInputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentInputStackView.heightAnchor.constraint(equalToConstant: 50),
            commentInputStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            commentInputStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commentInputStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
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
//        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
//        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        commentSendButton.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
    }
    
    @objc private func likeButtonTapped() {
        print("Like button tapped")
    }
    
    @objc private func commentButtonTapped() {
        print("Comment button tapped")
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
        
    }
}

// MARK: - UITableViewDelegate
@available(iOS 13.0, *)
extension CustomUIView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else {
            print("can't find CommentTableViewCell")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let profilePicture = UIImage(named: "profile-avatar.jpg", in: Bundle.module, compatibleWith: nil)
        cell.configure(profileImage: profilePicture, profileName: comments[indexPath.row].keys.first ?? "", commentText: comments[indexPath.row].values.first ?? "")
        return cell
    }
}
