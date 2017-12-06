//
//  Category+CoreDataProperties.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryTocourse: Course?
    @NSManaged public var categoryToimage: Image?

}
