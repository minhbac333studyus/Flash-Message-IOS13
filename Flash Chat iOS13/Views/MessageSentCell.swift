//
//  MessageSentCell.swift
//  Flash Chat iOS13
//
//  Created by Adam  on 3/19/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageSentCell: UITableViewCell {
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var messageBoder: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBoder.layer.cornerRadius = 15 }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
