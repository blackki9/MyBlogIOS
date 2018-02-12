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
    var basicAuthHeader: String? {get}
    var bodyString: String? {get}
    func makeModel(serialization: Serialization) -> Model
    var request: URLRequest {get}
}

protocol AuthApiResource : ApiResource {
    
}

extension AuthApiResource {
    var basicAuthHeader: String? {
        let username = "test23"
        let password = "password33"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        return base64LoginString
    }
}

extension ApiResource {
    
    var methodType: String {
        return "GET"
    }

    var basicAuthHeader: String? {
        return nil
    }
    
    var bodyString: String? {
        return nil
    }
    
    var url: URL {
        let url = baseURL + methodPath
        return URL(string: url)!
    }
    
    var request: URLRequest {
        var request = URLRequest(url: self.url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = self.methodType
        if let authHeader = basicAuthHeader {
            request.setValue("Basic \(authHeader)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = bodyString {
            let bodyData = body.data(using:String.Encoding.ascii, allowLossyConversion: false)
            request.httpBody = bodyData
        }       
        
        return request
    }
    
    func makeModel(data: Data) -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            return nil
        }
        
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        
        let wrapper = ApiWrapper(serialization: jsonSerialization);
        return wrapper.items.map(makeModel(serialization:));
    }
}
