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

protocol SignUpControllerInput {
    func showErrorMessage(errorMessage: String?)
    func signUpSucceeded()
}


class SignUpInteractor : SignUpControllerOutput {
    func signUp(with userName: String?, password: String?) {
        
    }
}
