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

protocol PostListDataSource {
    //TODO - add methods to access post data (title and text for now)
}

class PostListInteractor: PostListOutput {
    func loadData() {
        NetworkFacade.shared.loadPosts { (posts) in
            
        }
    }
}

extension PostListInteractor : PostListDataSource {
    
}
