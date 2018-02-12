//
//  PostListApiResource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct PostListApiResource: ApiResource {
    typealias Model = Post
    
    let methodPath = "/posts"
    
    func makeModel(serialization: Serialization) -> Model {
        return Post(serialization: serialization)
    }
}
