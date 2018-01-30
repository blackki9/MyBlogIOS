//
//  AddPostViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {

    fileprivate var output: AddPostOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutputAndInput()
        // Do any additional setup after loading the view.
    }

}

extension AddPostViewController {
    func configureOutputAndInput() {
        output = AddPostInteractor()
    }
}
