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
    
    private var gradient: CAGradientLayer!
    
    func configure(title: String, address: String, imageID: String?) {
        titleLabel.text = title
        addressLabel.text = address
        let width = Int(exactly: venueImageView.frame.width) ?? 0
        let height = Int(exactly: venueImageView.frame.height) ?? 0
        if let imageID = imageID, let url = URL(string: "https://fastly.4sqi.net/img/general/\(width)x\(height)\(imageID)") {
            venueImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeHolder"), options: [.transition(.fade(0.2))])
            if gradient == nil {
                gradient = CAGradientLayer()
                gradient.frame = venueImageView.frame
                gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
                gradient.locations = [0.0, 1.0]
                venueImageView.layer.insertSublayer(gradient, at: 0)
            }
        }
    }
    
}
