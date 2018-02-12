//
//  LoginViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    fileprivate var output: LoginControllerOutput?
    fileprivate var router: LoginRouterProtocol?
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutputAndInput()
    }
    
    //MARK: - Actions

    @IBAction func login(_ sender: Any) {
        output?.login(with: usernameField.text,
                      password: passwordField.text)
    }
}

//MARK: - extension

extension LoginViewController {
    func configureOutputAndInput() {
        let interactor = LoginInteractor()
        output = interactor
        interactor.output = self
        router = LoginRouter()
    }
}

extension LoginViewController: LoginControllerInput {
    
    func loginSucceded() {
        router?.showMainScreen()
    }
    
    func showError(errorMessage: String?) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
