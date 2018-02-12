//
//  TableViewDataSource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/8/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit
//
//protocol TableDataSourceProtocol {
//    associatedtype EntityType
//    
//    func entityCount() -> Int
//    func entity(with indexPath: IndexPath) -> EntityType?
//    
//}
//
//protocol TableViewDataSourceProtocol {
//    init(tableView: UITableView?, dataSource: TableDataSourceProtocol?)
//    func reload()
//}
//¡
//class TableViewDataSource : NSObject, TableViewDataSourceProtocol {
//    
//    fileprivate let tableView: UITableView?
//    fileprivate let dataSource: TableViewDataSourceProtocol?
//    
//    required init(tableView: UITableView?, dataSource: TableDataSourceProtocol?) {
//        super.init()
//    }
//    
//    func reload() {
//        
//    }
//}
//
//extension TableViewDataSource : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell", for: indexPath as IndexPath) as? PostListTableViewCell
//        
//        cell?.configure(with: self.dataSource?.postAt(index: indexPath.row))
//        
//        return cell!
//    }
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.dataSource?.postsCount ?? 0
//    }
//}
//
//extension TableViewDataSource: UITableViewDelegate {
//    
//}

