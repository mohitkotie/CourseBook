//
//  ViewController.swift
//  CourseBook
//
//  Created by mohit kotie on 08/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate{
    
    var controller:NSFetchedResultsController<Course>!
    
    
    @IBOutlet weak var myTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
       // testData()
        getFromCoreData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections{
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            
            let sectionItems = sections[section]
            return sectionItems.numberOfObjects
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! CourseCell
        
        updateCellInfo(cell: cell, indexpath: indexPath as NSIndexPath)
        return cell
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        
        switch type {
        case .delete:
            
            if let indexpath = indexPath{
                myTableView.deleteRows(at: [indexPath!], with: .fade)
            }
        case .insert:
            
            if let indexpath = newIndexPath{
                
                myTableView.insertRows(at: [indexPath!], with: .fade)
            }
        case .move:
            if let indexpath = indexPath{
                myTableView.deleteRows(at: [indexPath!], with: .fade)
            }
            if let indexpath = newIndexPath{
                
                myTableView.insertRows(at: [indexPath!], with: .fade)
            }
        case .update:
            if let indexpath = indexPath{
                let cell = myTableView.cellForRow(at: indexPath!)as! CourseCell
                updateCellInfo(cell: cell, indexpath: indexpath as NSIndexPath)
                
            }
       
        }
    }
    
    //FOR UPDATE CELL INFO
    
    func updateCellInfo(cell:CourseCell,indexpath:NSIndexPath){
        let course = controller.object(at: indexpath as IndexPath)
        cell.fillCellWithdData(course: course)
    }
    
    
    //UPDATE TABLEVIEW
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTableView.reloadData()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        myTableView.endUpdates()
    }
    
    
    
    //FETCH THE DATABASE HERE
    func getFromCoreData(){
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        let moneySort = NSSortDescriptor(key: "price", ascending: true)
        fetchRequest.sortDescriptors = [moneySort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do{
            try controller.performFetch()
        }catch{
            
            let error = error as NSError
            print("\(error)")
        }
    }
    
    
    func testData(){
        let course = Course(context: context)
        course.coursename = "ios development"
        course.email = "mohit42@gmail.com"
        course.price = 80
        
        let course1 = Course(context: context)
        course1.coursename = "android  development"
        course1.email = "mohit42@gmail.com"
        course1.price = 89
        
        let course2 = Course(context: context)
        course2.coursename = "ios development"
        course2.email = "mohitkotie42@gmail.com"
        course2.price = 87
        appdel.saveContext()
    }
    
}

