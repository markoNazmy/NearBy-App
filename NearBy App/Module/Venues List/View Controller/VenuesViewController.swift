//
//  VenuesViewController.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Result

class VenuesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // The testing app currently does not support universal url callbacks
        
        NetworkManager.shared.start(request: VenuesRequest.getVenues(latLang: "40.70601155960431,-73.9932125", limit: 10, offest: 1)) { (result: Result<Venues, AppError>) in
            print(result)
        }
        
        NetworkManager.shared.start(request: VenuesRequest.getPhotos(photoId: "51eabef6498e10cf3aea7942")) { (result: Result<VenuePhotosResp, AppError>) in
            print(result)
        }
        
    }
    
}

