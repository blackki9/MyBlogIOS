//
//  SignUpViewController.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    fileprivate var output: SignUpControllerOutput?
    fileprivate var router: LoginRouterProtocol?
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    
    @IBAction func signIn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUp(_ sender: Any) {
        output?.signUp(with: userNameField.text,
                       password: passwordField.text)
    }
    
}

extension SignUpViewController {
    func configureOutputAndInput() {
        let interactor = SignUpInteractor()
        output = interactor
        
        router = LoginRouter()
    }
}

extension SignUpViewController: SignUpControllerInput {
    func showErrorMessage(errorMessage: String?) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func signUpSucceeded() {
        router?.showMainScreen()
    }
}
