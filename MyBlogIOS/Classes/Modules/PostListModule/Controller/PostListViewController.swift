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
    fileprivate var router: PostListRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDependencies()
        configureTableView()
        configureRightBarButton()
        
        self.output?.loadData()
    }
}

//MARK: - extension

extension PostListViewController {
    func configureDependencies() {
        let interactor = PostListInteractor();
        self.output = interactor
        self.dataSource = interactor
        interactor.output = self
        
        router = PostListRouter(viewController: self)
    }
    
    func configureTableView() {
        tableDataSource = PostListTableDataSource(tableView: tableView, dataSource: dataSource)
        tableDataSource?.didCellSelected = {[weak self] (indexPath) -> Void in
            let post = self?.dataSource?.postAt(index: indexPath.row)
            self?.router?.showPostDetails(post: post)
        }
    }
    
    func configureRightBarButton() {
        let loggedIn = false
        
        self.navigationItem.rightBarButtonItem = (loggedIn) ? addPostButton() : loginButton()
    }
    
    func addPostButton() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(PostListViewController.showAddPost))
    }
    
    @objc func showAddPost() {
    }
    
    func loginButton() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(PostListViewController.showLogin))
    }
    
    @objc func showLogin() {
        router?.showLogin()
    }
}

extension PostListViewController : PostListInput {
    func showPosts() {
        tableDataSource?.reloadData()
    }
}
