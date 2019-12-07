//
//  VenuesViewController+VenuesViewExtension.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

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
