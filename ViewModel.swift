//
//  viewModel.swift
//  TestTableApp
//
//  Created by user on 23.11.21.
//

import Foundation

struct AddMarks: Codable {
    var key: String
    var value: String
}

class ViewModel {
    static let shared = ViewModel()

    let storage = UserDefaults.standard
    let storageKey = "Sofochka"
    
    var marksFiltered = [AddMarks]()

    var marks: [AddMarks] {
        get {
            if let data = storage.value(forKey: storageKey) as? Data {
                return try! PropertyListDecoder().decode([AddMarks].self, from: data)
            } else {
                return [AddMarks]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                storage.set(data, forKey: storageKey)
            }
        }
    }

    func filterMarks(searchText: String) {
        marksFiltered = marks.filter({ (markss: AddMarks) -> Bool in
            return markss.key.lowercased().contains(searchText.lowercased())
        })
    }
    
    func saveMark (key: String, value: String) {
        let mark = AddMarks(key: key, value: value)
        marks.insert(mark, at: 0)
    }

    func removeMark(indexPath: IndexPath) {
        marks.remove(at: indexPath.row)
    }
}

