//
//  VenuesPhotosUseCase.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import Foundation

struct VenuesPhotosUseCase {
    
    func execute(venueId: String, callback: @escaping VenuesPhotosResult) {
        VenuesRepository.fetchVenuesPhotos(venueId: venueId){(result) in
            callback(result)
        }
    }
    
}
