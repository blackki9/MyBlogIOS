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

class PostListInteractor: PostListOutput {
    func loadData() {
        NetworkFacade.shared.loadPosts { (posts) in
            
        }
    }
}
