//
//  ManagedPost+CoreDataProperties.swift
//  MyBlogIOS
//
//  Created by Vyacheslav Okulov on 2/2/18.
//  Copyright © 2018 Vyacheslav Okulov. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedPost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedPost> {
        return NSFetchRequest<ManagedPost>(entityName: "ManagedPost")
    }

    @NSManaged public var text: String?
    @NSManaged public var title: String?

}
