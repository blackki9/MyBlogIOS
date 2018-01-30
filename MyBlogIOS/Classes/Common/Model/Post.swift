//
//  Post.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

struct Post {
    let title: String?
    let text: String?
}

extension Post {
    private enum Keys: String, SerializationKey {
        case title = "title"
        case text = "text"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)
        text = serialization.value(forKey: Keys.text)
    }
}
