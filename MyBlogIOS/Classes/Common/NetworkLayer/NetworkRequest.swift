//
//  NetworkRequest.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/26/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol NetworkRequest: class {
    associatedtype Model
    func perform(withCompletion completion: @escaping (Model?) -> Void)
    func decode(_ data: Data) -> Model?
}

extension NetworkRequest {
    func perform(_ url: URL,withCompletion completion: @escaping (Model?) -> Void) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            completion(self?.decode(data))
        }
        
        task.resume()
    }
}
