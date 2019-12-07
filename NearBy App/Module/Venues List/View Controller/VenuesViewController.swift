//
//  VenuesViewController.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import Result
import CoreLocation
import Reusable

class VenuesViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var emptyView: UIView!
    
    let locationManager = CLLocationManager()
    var presenter: VenuesPresenter!
    var activityIndicatorView = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupTableView()
        setupSegmentedControl()
        setupLoactionManager()
    }
    
    func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = presenter.state.rawValue
    }
    
    func setupPresenter() {
        presenter = VenuesPresenter(view: self)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "VenueTableViewCell", bundle: nil), forCellReuseIdentifier: "VenueTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 270
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func refreshView() {
        setupLoactionManager()
    }
    
    func setupLoactionManager() {
        if CLLocationManager.authorizationStatus() != .authorizedAlways && CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        activeLocationManager()
    }
    
    func activeLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 500
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
    }
    
    func getItemPhoto(item: Items) {
        presenter.getVenuePhotos(item: item)
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        presenter.updateAppState(index: segmentedControl.selectedSegmentIndex)
    }
}

extension VenuesViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if presenter.state == .singleUpdate {
                locationManager.stopUpdatingLocation()
            }
            presenter.getVenues(latlang: "\(location.coordinate.latitude),\(location.coordinate.longitude)", shouldRefresh: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

extension VenuesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VenueTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = presenter.items[indexPath.row]
        let address: String = item.venue?.location?.formattedAddress.flatMap({ return "\($0) " }) ?? ""
        if item.photoURL == nil {
            getItemPhoto(item: item)
        }
        cell.configure(title: "\(item.venue?.name ?? "")", address: address, imageID: item.photoURL)
        return cell
    }
    
}

 
extension VenuesViewController: VenuesView {
    func showErrorView() {
        errorView.isHidden = false
    }
    
    func hideErrorView() {
        errorView.isHidden = true
    }
    
    func showLoadingView() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = tableView.center
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingView() {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
    
    func showEmptyStateView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyStateView() {
        emptyView.isHidden = true
    }
    
    func refreshList() {
        tableView.reloadData()
    }
    
    func refreshListWithAnimation() {
        tableView.reloadSections([0], with: .automatic)
    }
    
    func refreshLoactionManager() {
        refreshView()
    }
    
}
