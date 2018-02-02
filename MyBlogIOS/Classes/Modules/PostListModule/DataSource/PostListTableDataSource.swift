//
//  PostListTableDataSource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/31/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostListTableDataSource : NSObject {
    
    fileprivate let tableView: UITableView?
    
    init(tableView: UITableView?) {
        self.tableView = tableView
        super.init()
        setupNibs()
    }
    
    private func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.reloadData()
    }
    
    private func setupNibs() {
        let nib = UINib(nibName: "PostListTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "PostListTableViewCell")
    }
}

extension PostListTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as IndexPath)
        cell.textLabel!.text =  "\(indexPath.row) - Its working"
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}

extension PostListTableDataSource : UITableViewDelegate {
    
}
