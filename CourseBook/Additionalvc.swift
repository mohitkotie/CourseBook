//
//  Additionalvc.swift
//  CourseBook
//
//  Created by mohit kotie on 09/10/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import CoreData

class Additionalvc: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate{

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var price: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    var category = [Category]()
    var imagePicker :UINavigationController!
    //use in did select row
    var existingCourse: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        getTestDataPi()
        getCateData()
        
    }
    
    
    @IBAction func pickImageTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage{

            myImage.image = ima
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func deleteTapped(_ sender: Any) {


    }

    @IBAction func saveTapped(_ sender: Any) {





    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = self.category[row]
        return category.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       //
    }
    
    
    
    func getCateData(){
        
//        let fetchme = NSFetchRequest<Category> = Category.fetchRequest()
        do{
            self.category = try context.fetch(Category.fetchRequest())
            self.categoryPicker.reloadAllComponents()
            
        }catch{
            
            //handel error
        }
        
        
    }
    
    func getTestDataPi(){
        
        let category1 = Category(context: context)
        category1.name = "ios 11"
        
        let category2 = Category(context: context)
        category2.name = "android"
        
        let category3 = Category(context: context)
        category3.name = "data science"
        
        let category4 = Category(context: context)
        category4.name = "machine learning"
        
        let category5 = Category(context: context)
        category5.name = "al"
        
        appdel.saveContext()
        
    }
    
    
    
    
    
    
    
    
    
}

