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
    private lazy var countView = CountView()
    private lazy var buttonStackView = LikeCommentShareStackView()
    private lazy var commentTableView: UITableView = UITableView()
    private lazy var commentInputStackView = CommentInputStackView()
    
    private var comments = [["Steve Rogers": "What a pack!!"],["Tony Stark": "good good good good good good good good good good good good good good good good good good good good"],["Dr Bruce": "Hes lost fr"],["Clint Barton": "I got this pack. speed was okayish"],["Natasha Romarof": "Man! Everytime i browse google it slows down for me. idk why"]]
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
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
        buttonStackView.delegate = self
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
    
    private func configureCommentInputStackView() {
        commentInputStackView.delegate = self
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

// MARK: - Button Actions
@available(iOS 13.0, *)
extension CustomUIView: LikeCommentShareStackViewDelegate, CommentInputStackViewDelegate {
    func didTapLike(_ stackView: LikeCommentShareStackView) {
        print("Like Button tapped")
    }
    
    func didTapComment(_ stackView: LikeCommentShareStackView) {
        print("Comment Button tapped")
    }
    
    func didTapShare(_ stackView: LikeCommentShareStackView) {
        let textToShare = "Share button tapped!"
        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        if let viewController = self.viewController() {
            viewController.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func didTapSendButton(_ commentInputStackView: CommentInputStackView, withText text: String?) {
    }
}

