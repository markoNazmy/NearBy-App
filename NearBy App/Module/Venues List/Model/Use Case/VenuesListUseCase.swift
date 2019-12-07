//
//  VenuesListUseCase.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import Foundation

class VenuesListUseCase {
    
    var currentPage: Int = 0
    var pageSize: Int = 10
    
    func execute(latLang: String, shouldRefresh: Bool, callback: @escaping VenuesResult) {
        currentPage = shouldRefresh ? 1 : currentPage
        VenuesRepository.fetchVenues(latLang: latLang, limit: pageSize, offest: currentPage * pageSize){ [weak self] (result) in
            switch result {
            case let .success(feed):
                callback(.success(feed))
                self?.currentPage += 1
            case let .failure(error):
                callback(.failure(error))
            }
        }
    }
    
}
