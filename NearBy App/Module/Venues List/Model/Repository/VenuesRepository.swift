//
//  VenuesRepository.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import Foundation
import Result

typealias VenuesResult = (Result<Venues, AppError>) -> Void
typealias VenuesPhotosResult = (Result<VenuePhotosResp, AppError>) -> Void

struct VenuesRepository {
    
    static func fetchVenues(latLang: String, limit: Int, offest: Int, result: @escaping VenuesResult) {
        NetworkManager.shared.start(request: VenuesRequest.getVenues(latLang: "\(latLang)", limit: limit, offest: offest)) { (mappedResult: Result<Venues, AppError>) in
            result(mappedResult)
        }
    }
    
    static func fetchVenuesPhotos(venueId: String, result: @escaping VenuesPhotosResult) {
        NetworkManager.shared.start(request: VenuesRequest.getPhotos(photoId: venueId)) { (mappedResult: Result<VenuePhotosResp, AppError>) in
           result(mappedResult)
        }
    }
    
}
