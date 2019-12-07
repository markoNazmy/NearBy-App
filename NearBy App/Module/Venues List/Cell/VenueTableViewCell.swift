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
    private var itemID: String!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient?.frame = venueImageView.frame
    }
    
    func configure(item: Items) {
        self.itemID = item.venue?.id ?? ""
        titleLabel.text = item.venue?.name ?? ""
        let address: String = item.venue?.location?.formattedAddress.flatMap({ return "\($0) " }) ?? ""
        addressLabel.text = address
    }
    
    func configureImageView(item: Items) {
        if item.venue?.id ?? "" == self.itemID {
            let width = Int(exactly: UIScreen.main.bounds.width) ?? 0
            let height = 250
            if let imageID = item.photoURL, let url = URL(string: "https://fastly.4sqi.net/img/general/\(width)x\(height)\(imageID)") {
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
    
}
