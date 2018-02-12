//
//  AddPostApiResource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/9/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct AddPostApiResource: AuthApiResource {
    typealias Model = Post
    
    fileprivate let postToSend: Dictionary<String,String>
    let methodPath = "/posts"
    let methodType = "POST"
    var bodyString: String? {
        let titleKey = Post.Keys.title.rawValue
        let textKey = Post.Keys.text.rawValue
        guard let title = postToSend[titleKey], let text = postToSend[textKey] else {
            return nil
        }
        
        return "\(titleKey)=\(title)&\(textKey)=\(text)"
    }
    
    init(postToSend: Dictionary<String,String>) {
        self.postToSend = postToSend
    }
    
    func makeModel(serialization: Serialization) -> Model {
        return Post(serialization: serialization)
    }
}
