//
//  ViewController.swift
//  TestTableApp
//
//  Created by user on 22.11.21.
//

import UIKit

class ViewController: UIViewController {
    let idCell = "MyCell"
    let refreshTable = UIRefreshControl()
    var searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        search()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    func setup() {
        configureTableView()
        configureNavigationStuff()
        configureRefreshThing()
    }

    func search() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Seeearch"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }

    func configureNavigationStuff() {
        let addingData = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addNewValues))
        navigationItem.rightBarButtonItem = addingData
    }

    func configureRefreshThing() {
        refreshTable.tintColor = .black
        refreshTable.attributedTitle = NSAttributedString(string: "Update")
        refreshTable.addTarget(self, action: #selector(updateTable), for:  .valueChanged)
        tableView.refreshControl = refreshTable
    }

    @objc func updateTable() {
        tableView.reloadData()
        refreshTable.endRefreshing()
    }

    @objc func addNewValues() {
        let vc = storyboard?.instantiateViewController(identifier: "AddDataViewController") as! AddDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
