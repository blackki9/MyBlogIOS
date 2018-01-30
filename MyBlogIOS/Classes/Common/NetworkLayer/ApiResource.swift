//
//  ApiResource.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 1/26/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype Model
    var baseURL: String {get}
    var methodType: String {get}
    var methodPath: String {get}
    func makeModel(serialization: Serialization) -> Model
}

extension ApiResource {
    
    var methodType: String {
        return "GET"
    }
    
    var url: URL {
        let url = baseURL
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        
        let wrapper = ApiWrapper(serialization: jsonSerialization);
        return wrapper.items.map(makeModel(serialization:));
    }
}
