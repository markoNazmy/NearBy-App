//
//  VenueTableViewCell.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class VenueTableViewCell: UITableViewCell, NibOwnerLoadable, Reusable {

    @IBOutlet weak private var venueImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String, address: String, imageID: String?) {
        titleLabel.text = title
        addressLabel.text = address
        if let imageID = imageID, let url = URL(string: "https://fastly.4sqi.net/img/general/\(venueImageView.frame.width)x\(venueImageView.frame.height)/\(imageID)") {
            venueImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeHolder"), options: [.transition(.fade(0.2))])
        }
    }
    
}
