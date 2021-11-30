//
//  SearchExVC.swift
//  TestTableApp
//
//  Created by user on 24.11.21.
//

import Foundation
import UIKit

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        ViewModel.shared.filterMarks(searchText: searchController.searchBar.text!)
        tableView.reloadData()
    }

    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }

    var isSearch: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
}


