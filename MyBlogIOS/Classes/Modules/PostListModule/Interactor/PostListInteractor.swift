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
    func showPosts()
}

protocol PostListDataSource {
    var postsCount: Int {get}
    func postAt(index: Int) -> Post?
}

class PostListInteractor: PostListOutput {
    fileprivate var posts = [Post]();
    var output: PostListInput?
    func loadData() {
        NetworkFacade.shared.loadPosts { (posts) in
            guard let posts = posts else {
                return
            }

            self.posts = posts
            DispatchQueue.main.async {
                self.output?.showPosts()
            }
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
