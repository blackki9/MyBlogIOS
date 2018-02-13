//
//  SignUpInteractor.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/30/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol SignUpControllerOutput {
    func signUp(with userName: String?, password: String?)
}

protocol SignUpControllerInput : class {
    func showErrorMessage(errorMessage: String?)
    func signUpSucceeded()
}


class SignUpInteractor : SignUpControllerOutput {
    weak var output: SignUpControllerInput?
    
    func signUp(with userName: String?, password: String?) {
        guard let userName = userName, let password = password else {
            output?.showErrorMessage(errorMessage: "You must provide both user name and password")
            return
        }
        NetworkFacade.shared.signUp(with: userName, password: password) {
            DispatchQueue.main.async {
                self.output?.signUpSucceeded()
            }
        }
    }
}
