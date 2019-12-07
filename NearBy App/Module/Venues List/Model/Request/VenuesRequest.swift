//
//  VenuesRequest.swift
//  NearBy App
//
//  Created by marko nazmy on 12/6/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import Foundation
import Alamofire

enum VenuesRequest: Request {

    case getVenues(latLang: String, limit: Int, offest: Int)
    case getPhotos(photoId: String)

    var baseUrl: String? {
        return nil
    }
    
    var path: String {
        switch self {
        case .getVenues:
            return "/venues/explore"
        case .getPhotos(let photoId):
            return "/venues/\(photoId)/photos"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getVenues(let latLang, let limit, let offest):
            return ["ll": latLang,
                    "limit": limit,
                    "offest": offest]
        case .getPhotos:
            return ["limit": 1,
                    "offest": 0]
        }
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        return .returnCacheDataElseLoad
    }
}
