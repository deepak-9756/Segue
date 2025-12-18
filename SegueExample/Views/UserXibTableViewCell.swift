//
//  UserXibTableViewCell.swift
//  SegueExample
//
//  Created by Merger on 17/12/25.
//

import UIKit

class UserXibTableViewCell: UITableViewCell {

    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var avtarImage: UIImageView!
    @IBOutlet weak var userlabel: UILabel!
    static let identifier = "UserXibTableViewCell"
    
    func configure(user: UserModel){
        avtarImage.image = user.avtar
        userlabel.text = user.name
        bio.text = user.bio
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
