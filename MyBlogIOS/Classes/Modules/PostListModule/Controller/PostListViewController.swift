//
//  PostListViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {

    fileprivate var output:PostListOutput? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutput()
        // Do any additional setup after loading the view.
    }
    
}

extension PostListViewController {
    func configureOutput() {
        self.output = PostListInteractor()
    }
}
