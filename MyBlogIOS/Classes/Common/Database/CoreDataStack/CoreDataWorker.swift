//
//  CoreDataWorker.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/6/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//

import CoreData
import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol CoreDataWorkerProtocol {
    associatedtype EntityType

    func get(with predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, completion: @escaping (Result<[EntityType]>) -> Void)
    
}
