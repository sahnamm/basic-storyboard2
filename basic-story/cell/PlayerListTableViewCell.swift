//
//  PlayerListTableViewCell.swift
//  basic-story
//
//  Created by Sahna Melly Marselina on 28/02/23.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        layoutIfNeeded()
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}

class PlayerListTableViewCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.textColor = .blue

        // image
        img.roundedImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
