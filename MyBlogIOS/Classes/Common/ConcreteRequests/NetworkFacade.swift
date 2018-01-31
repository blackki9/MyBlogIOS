//
//  NetworkFacade.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/27/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

final class NetworkFacade {
    
    static let shared = NetworkFacade()
    private var requests = [AnyObject]();
    
    private init() {
        
    }
    
    func loadPosts(withCompletion completion: @escaping ([Post]?) -> Void) {
        let postListResource = PostListApiResource()
        let postsRequest = ApiRequest(resource: postListResource)
        requests.append(postsRequest)
        
        postsRequest.perform {[weak self] (posts) in
            self?.requests.removeAll()
            completion(posts)
        }
    }
}

extension ApiResource {
    var baseURL: String {
        return ""
    }
}
