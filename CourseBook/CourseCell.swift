//
//  CourseCell.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseEmail: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    
    func fillCellWithdData(course:Course){
    courseName.text = course.coursename
    courseEmail.text = course.email
    coursePrice.text = "$\(course.price)"
    
        
        // todo: set image later
    }
}
