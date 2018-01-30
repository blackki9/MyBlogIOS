//
//  LoginViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    fileprivate var output: LoginOutput?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension LoginViewController {
    func configureOutputAndInput() {
        output = LoginInteractor()
    }
}
