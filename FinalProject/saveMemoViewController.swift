//
//  saveMemoViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/04.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit
import CoreData

class saveMemoViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var memoTitle: UITextField!
    @IBOutlet var memoContents: UITextView!
    
    func getContext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Memo", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(memoTitle.text, forKey: "memoTitle")
        object.setValue(memoContents.text, forKey: "memoContents")
        object.setValue(Date(), forKey: "memoDate")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
