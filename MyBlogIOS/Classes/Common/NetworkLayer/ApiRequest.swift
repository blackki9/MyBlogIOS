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
        perform(resource.url, withCompletion: completion)
    }

}
