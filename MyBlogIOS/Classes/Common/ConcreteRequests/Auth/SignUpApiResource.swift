//
//  SignUpApiResource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/13/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct SignUpApiResource: AuthApiResource {
    typealias Model = User
    
    let userName: String?
    let password: String?
    
    let methodPath = "/auth/signup"
    let methodType = "POST"
    
    var bodyString: String? {
        let userNameKey = User.Keys.userName.rawValue
        let passwordKey = User.Keys.password.rawValue
        guard let userName = userName, let password = password else {
            return nil
        }
        
        return "\(userNameKey)=\(userName)&\(passwordKey)=\(password)"
    }
    
    func makeModel(serialization: Serialization) -> Model {
        return User(serialization: serialization)
    }
}
