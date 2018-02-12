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
    fileprivate let dataSource: PostListDataSource?
    var didCellSelected: ((_ indexPath: IndexPath) -> Void)?
    
    init(tableView: UITableView?, dataSource: PostListDataSource?) {
        self.tableView = tableView
        self.dataSource = dataSource
        super.init()
        configureTableView()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    private func configureTableView() {
        setupNibs()
        
        tableView?.estimatedRowHeight = 44.0;
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell", for: indexPath as IndexPath) as? PostListTableViewCell
        
        cell?.configure(with: self.dataSource?.postAt(index: indexPath.row))
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.postsCount ?? 0
    }
}

extension PostListTableDataSource : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectCompletion = didCellSelected else {
            return
        }
        
        selectCompletion(indexPath)
    }
}
