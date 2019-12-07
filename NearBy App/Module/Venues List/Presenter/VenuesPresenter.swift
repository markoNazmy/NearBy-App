//
//  VenuesPresenter.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import Foundation

protocol VenuesView: class {
    func refreshList()
    func refreshListWithAnimation()
    func refreshLoactionManager()
    func showErrorView()
    func hideErrorView()
    func showLoadingView()
    func hideLoadingView()
    func showEmptyStateView()
    func hideEmptyStateView()
}

class VenuesPresenter {
    
    enum State: Int {
        case singleUpdate
        case realtime
    }
    
    let defaults = UserDefaults.standard
    var state: State {
        get {
            if let value = defaults.object(forKey: "LocationMode") as? Int, let mode = State(rawValue: value) {
                return mode
            } else {
                defaults.set(State.singleUpdate.rawValue, forKey: "LocationMode")
                return .singleUpdate
            }
        }
    }
    
    let venuesListUseCase = VenuesListUseCase()
    let venuesPhotosUseCase = VenuesPhotosUseCase()
    weak var view: VenuesView!
    var items: [Items] = []
    
    init(view: VenuesView) {
        self.view = view
        view.hideErrorView()
        view.hideEmptyStateView()
    }
    
    func getVenues(latlang: String, shouldRefresh: Bool) {
        view.hideErrorView()
        view.hideEmptyStateView()
        view.showLoadingView()
        venuesListUseCase.execute(latLang: latlang, shouldRefresh: shouldRefresh) {[weak self] (result) in
            switch result {
            case .success(let venues):
                self?.items = venues.response?.groups?[0].items ?? []
                if self?.items.isEmpty == true {
                    self?.view.showEmptyStateView()
                } else {
                    self?.view.refreshListWithAnimation()
                }
            case .failure(_):
                self?.view.showErrorView()
            }
            self?.view.hideLoadingView()
        }
    }
    
    func getVenuePhotos(item: Items, cell: VenueTableViewCell) {
        venuesPhotosUseCase.execute(venueId: item.venue?.id ?? "") {(result) in
            switch result {
            case .success(let photos):
                if photos.response?.photos?.items?.isEmpty == false {
                    item.photoURL = photos.response?.photos?.items?[0].suffix ?? ""
                }
                cell.configureImageView(item: item)
            case .failure(_):
                break
            }
        }
    }
    
    func updateAppState(index: Int) {
        defaults.set(index, forKey: "LocationMode")
        view.refreshLoactionManager()
    }
}
