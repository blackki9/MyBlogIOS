//
//  User.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/12/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct User {
    let userName: String?
    let userId: String?
  
    enum Keys: String, SerializationKey {
        case userName = "username"
        case userId = "userId"
    }
}

extension User {
    
    init(serialization: Serialization) {
        userName = serialization.value(forKey: Keys.userName)
        userId = serialization.value(forKey: Keys.userId)
    }
}
