//
//  Post.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

fileprivate let maxTextLengthForPresentation = 200

struct Post {
    let title: String?
    let text: String?
    let createdAt: Int?
    let postId: String?
    let userId: String?
    
    enum Keys: String, SerializationKey {
        case title = "title"
        case text = "text"
        case createdAt = "createdAt"
        case userId = "userId"
        case postId = "postId"
    }
    
    var textToPresent: String? {
//        guard let text = text else {
//            return nil
//        }
//        let textLength = text.count
//        let indexOfPresentationEnd = (textLength > maxTextLengthForPresentation) ? maxTextLengthForPresentation : textLength
        
        return text
    }
}

extension Post {

    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)
        text = serialization.value(forKey: Keys.text)
        createdAt = serialization.value(forKey: Keys.createdAt)
        postId = serialization.value(forKey: Keys.postId)
        userId = serialization.value(forKey: Keys.userId)
    }
}
