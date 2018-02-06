//
//  PostListInteractor.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol PostListOutput {
    func loadData()
}

protocol PostListInput {
    
}

protocol PostListDataSource {
    var postsCount: Int {get}
    func postAt(index: Int) -> Post?
}

class PostListInteractor: PostListOutput {
    fileprivate let posts = [Post(title: "test",text: "sjsglkjgklsj klgjklsjklgjlslj"),
                             Post(title: "test",text: "sjsglkjgklsj klgjklsjklgjlslj sf"),
                             Post(title: "test",text: "sjsglkjgklsj klgjklsjklgjlf21421421slj")];
    func loadData() {
        NetworkFacade.shared.loadPosts { (posts) in
            
        }
    }
}

extension PostListInteractor : PostListDataSource {
    
    var postsCount: Int {
        return posts.count
    }
    
    func postAt(index: Int) -> Post? {
        guard index >= 0 && index < posts.count else {
            return nil
        }
        
        return posts[index]
    }
}
