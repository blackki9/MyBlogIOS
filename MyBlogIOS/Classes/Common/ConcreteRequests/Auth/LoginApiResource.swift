//
//  LoginRequest.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/12/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct LoginApiResource: AuthApiResource {
    typealias Model = User
    
    let methodPath = "/auth/login"
    
    func makeModel(serialization: Serialization) -> Model {
        return User(serialization: serialization)
    }
}
