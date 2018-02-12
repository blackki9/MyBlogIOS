//
//  LoginInteractor.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol LoginControllerOutput {
    func login(with username: String?, password: String?)
}

protocol LoginControllerInput: class {
    func showError(errorMessage: String?)
    func loginSucceded()
}

class LoginInteractor : LoginControllerOutput {
    weak var output: LoginControllerInput?
    
    func login(with userName: String?, password: String?) {
        guard let userName = userName, let password = password else {
            output?.showError(errorMessage: "You must provide both user name and password")
            return
        }
        
        NetworkFacade.shared.login(with: userName,
                                   password: password)
    }
}
