//
//  ApiRequest.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/26/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ApiRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.Model]? {
        return resource.makeModel(data: data)
    }
    
    func perform(withCompletion completion: @escaping (Model?) -> Void) {
        perform(resource.request) { [weak self] (data) in
            guard let data = data else {
                return completion(nil)
            }
            
            completion(self?.decode(data))
        }
    }

    func performBodyRequest(withCompletion completion: @escaping () -> Void) {
        perform(resource.request) { (data) in
            let result = String(data: data!, encoding: .utf8)
            completion()
        }
    }
}
