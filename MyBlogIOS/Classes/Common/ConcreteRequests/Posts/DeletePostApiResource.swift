//
//  DeletePostApiResource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/11/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct DeletePostApiResource: AuthApiResource {
    typealias Model = Post
    
    private let postId: String
    
    var methodPath: String {
        return "/posts/\(postId)"
    }
    let methodType = "DELETE"
    
    init(postId: String) {
        self.postId = postId
    }
    
    func makeModel(serialization: Serialization) -> Model {
        return Post(serialization: serialization)
    }
}
