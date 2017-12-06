//
//  Course+CoreDataProperties.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var publisheddate: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var email: String?
    @NSManaged public var coursename: String?
    @NSManaged public var courseTocategory: Category?
    @NSManaged public var courseToimage: Image?

}
