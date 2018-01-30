//
//  SignUpViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    fileprivate var output: SignUpOutput?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SignUpViewController {
    func configureOutputAndInput() {
        output = SignUpInteractor();
    }
}
