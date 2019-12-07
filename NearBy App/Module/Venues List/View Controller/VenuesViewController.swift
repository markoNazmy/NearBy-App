//
//  VenuesViewController.swift
//  NearBy App
//
//  Created by marko nazmy on 12/5/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit
import CoreLocation

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
    
    func getItemPhoto(item: Items, cell: VenueTableViewCell) {
        presenter.getVenuePhotos(item: item, cell: cell)
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        presenter.updateAppState(index: segmentedControl.selectedSegmentIndex)
    }
}
