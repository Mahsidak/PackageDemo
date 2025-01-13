//
//  ManageAccountEmptyTableViewCell.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import UIKit

class ManageAccountEmptyTableViewCell: UITableViewCell {

    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
