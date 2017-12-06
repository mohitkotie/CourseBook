//
//  Course+CoreDataClass.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.publisheddate = NSDate()
    }

}
