//
//  CommentTableViewCell.swift
//  PackageDemo
//
//  Created by Mahamud Siddiquee on 13/1/25.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var commentHolerView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupUI() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
        commentHolerView.layer.cornerRadius = 10
    }
    
}
