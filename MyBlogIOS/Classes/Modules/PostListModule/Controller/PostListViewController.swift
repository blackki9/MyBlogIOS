//
//  PostListViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    fileprivate var output:PostListOutput? = nil
    fileprivate var dataSource: PostListDataSource? = nil
    fileprivate var tableDataSource: PostListTableDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutput()
        configureTableView()
    }
    
}

//MARK: - extension

extension PostListViewController {
    func configureOutput() {
        let interactor = PostListInteractor();
        self.output = interactor
        self.dataSource = interactor
    }
    
    func configureTableView() {
        tableDataSource = PostListTableDataSource(tableView: tableView, dataSource: dataSource)
    }
}
