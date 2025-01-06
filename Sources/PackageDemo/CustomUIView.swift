//
//  CustomUIView.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 6/1/25.
//

import Foundation
import UIKit

// MARK: - Delegate Protocol
public protocol CustomUIViewDelegate: AnyObject {
    func customUIViewButton1Tapped()
    func customUIViewButton2Tapped()
}

public class CustomUIView: UIView {

    // MARK: - Properties
    private let titleLabel = UILabel()
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let containerView = UIView()

    public weak var delegate: CustomUIViewDelegate?

    // MARK: - Initializers
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
        // Configure container view
        containerView.backgroundColor = UIColor.darkGray
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)

        // Configure title label
        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Configure buttons
        button1.setTitle("Button 1", for: .normal)
        button2.setTitle("Button 2", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button1.backgroundColor = UIColor.white
        button2.backgroundColor = UIColor.white
        button1.layer.cornerRadius = 8
        button2.layer.cornerRadius = 8
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false

        // Add subviews
        containerView.addSubview(titleLabel)
        containerView.addSubview(button1)
        containerView.addSubview(button2)

        // Set up constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            button1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -10),
            button1.heightAnchor.constraint(equalToConstant: 44),

            button2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            button2.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 10),
            button2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            button2.heightAnchor.constraint(equalToConstant: 44),
        ])

        // Add actions to buttons
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
    }

    // MARK: - Public Methods

    /// Set the title of the view
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }

    /// Set the titles of the buttons
    public func setButtonTitles(_ title1: String, _ title2: String) {
        button1.setTitle(title1, for: .normal)
        button2.setTitle(title2, for: .normal)
    }

    /// Customize the background color of the container view
    public func setContainerBackgroundColor(_ color: UIColor) {
        containerView.backgroundColor = color
    }

    /// Customize the corner radius of the container view
    public func setContainerCornerRadius(_ radius: CGFloat) {
        containerView.layer.cornerRadius = radius
    }

    /// Customize the shadow properties of the container view
    public func setContainerShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        containerView.layer.shadowColor = color.cgColor
        containerView.layer.shadowOpacity = opacity
        containerView.layer.shadowOffset = offset
        containerView.layer.shadowRadius = radius
    }

    /// Customize the title label's font and text color
    public func setTitleLabelFont(_ font: UIFont) {
        titleLabel.font = font
    }

    public func setTitleLabelTextColor(_ color: UIColor) {
        titleLabel.textColor = color
    }

    /// Customize button 1's properties
    public func setButton1BackgroundColor(_ color: UIColor) {
        button1.backgroundColor = color
    }

    public func setButton1TitleColor(_ color: UIColor, for state: UIControl.State) {
        button1.setTitleColor(color, for: state)
    }

    public func setButton1CornerRadius(_ radius: CGFloat) {
        button1.layer.cornerRadius = radius
    }

    /// Customize button 2's properties
    public func setButton2BackgroundColor(_ color: UIColor) {
        button2.backgroundColor = color
    }

    public func setButton2TitleColor(_ color: UIColor, for state: UIControl.State) {
        button2.setTitleColor(color, for: state)
    }

    public func setButton2CornerRadius(_ radius: CGFloat) {
        button2.layer.cornerRadius = radius
    }

    // MARK: - Button Actions
    @objc private func button1Tapped() {
        delegate?.customUIViewButton1Tapped()
    }

    @objc private func button2Tapped() {
        delegate?.customUIViewButton2Tapped()
    }
}
