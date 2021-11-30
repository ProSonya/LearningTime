//
//  DataSourceExVC.swift
//  TestTableApp
//
//  Created by user on 24.11.21.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return ViewModel.shared.marksFiltered.count
        }
        return  ViewModel.shared.marks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: MyTableViewCell!
        var mark: AddMarks

        if isSearch {
            mark = ViewModel.shared.marksFiltered[indexPath.row]
        } else {
            mark = ViewModel.shared.marks[indexPath.row]
        }

        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: idCell) as? MyTableViewCell {
            cell = reuseCell
        } else {
            cell = MyTableViewCell()
        }

        cell.keyValue.text = mark.key
        cell.valueValue.text = mark.value
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDelete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, success) in
            self.tableView.performBatchUpdates({
                ViewModel.shared.removeMark(indexPath: indexPath)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }, completion: nil)
        }
        
        return UISwipeActionsConfiguration(actions: [swipeDelete])
    }
}
