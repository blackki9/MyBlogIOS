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
    private enum Keys: String, SerializationKey {
        case title = "title"
        case text = "text"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)
        text = serialization.value(forKey: Keys.text)
    }
}
