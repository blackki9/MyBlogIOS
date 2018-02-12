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
    
    func addPost(post: Post?, withCompletion completion: @escaping () -> Void) {
        let addPostResource = AddPostApiResource(postToSend: ["title": "test new", "text": "gsdklglksdgklklsdklg klsdklgklsdklg klsdlgksd"])
        let addPostRequest = ApiRequest(resource: addPostResource)
        
        addPostRequest.performBodyRequest(withCompletion: completion)
    }
    
    func deletePost(postId: String, withCompletion completion: @escaping () -> Void) {
        let deletePostResource = DeletePostApiResource(postId: "5a7880616c3dcc001475ef3a")
        let deletePostRequest = ApiRequest(resource: deletePostResource)
        
        deletePostRequest.performBodyRequest(withCompletion: completion)
    }
    
    func login(with userName: String, password: String) {
        let resource = LoginApiResource()
        let loginRequest = ApiRequest(resource: resource)
        
        loginRequest.perform { (users) in
            print(users?.count ?? 0)
        }
    }
}

extension ApiResource {
    var baseURL: String {
        return "https://myblog-vyacheslav-okulov.herokuapp.com/api"
    }
}
