//
//  Image+CoreDataProperties.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageTocourse: Course?
    @NSManaged public var imageTocategoey: Category?

}
