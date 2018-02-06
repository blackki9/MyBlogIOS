//
//  PostDetailsViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    fileprivate var output: PostDetailsOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOutputAndInput()
    }
}

extension PostDetailsViewController {
    func configureOutputAndInput() {
        output = PostDetailsInteractor()
    }
 
}
