//
//  VenuesViewController+TableViewExtension.swift
//  NearBy App
//
//  Created by marko nazmy on 12/7/19.
//  Copyright © 2019 MarkoNazmy. All rights reserved.
//

import UIKit

extension VenuesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VenueTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = presenter.items[indexPath.row]
        if item.photoURL == nil {
            getItemPhoto(item: item, cell: cell)
        }
        cell.configure(item: item)
        cell.configureImageView(item: item)
        return cell
    }
    
}
