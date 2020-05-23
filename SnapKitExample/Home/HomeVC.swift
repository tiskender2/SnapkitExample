//
//  HomeVC.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSingletonVC.shared.movies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "XibCell", for: indexPath) as! XibCell
            cell.setCell(model:HomeSingletonVC.shared.movies?.results?[indexPath.row] ?? Result())
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SnapKitCell", for: indexPath) as! SnapKitCell
            cell.setCell(model:HomeSingletonVC.shared.movies?.results?[indexPath.row] ?? Result())
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let label = UILabel()
            label.text = "XIB"
            label.textColor = .white
            label.backgroundColor = .black
            label.textAlignment = .center
            return label
        } else {
            let label = UILabel()
            label.text = "SNAPKIT"
            label.textColor = .white
            label.textAlignment = .center
            label.backgroundColor = .black
            return label
        }
    }
}
// MARK: UI
extension HomeVC {
    func setupUI(){
       refreshTableView()
       setupSuperView()
       setupTableView()
       setupNavBar()
       getMovies()
    }
    
    fileprivate func setupSuperView(){
        view.backgroundColor = .white
    }
    func refreshTableView(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(self.refreshTable),
                                       name: Notification.Name("refreshTableView"),
                                       object: nil)
    }
    @objc func refreshTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    fileprivate func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(SnapKitCell.self, forCellReuseIdentifier: "SnapKitCell")
        tableView.register(UINib(nibName: "XibCell", bundle: nil), forCellReuseIdentifier: "XibCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    fileprivate func setupNavBar(){
        navigationItem.title = "SnapKitExample"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
//MARK: SERVICE
extension HomeVC {
    func getMovies(){
        HomeSingletonVC.shared.getMovies()
    }
}
