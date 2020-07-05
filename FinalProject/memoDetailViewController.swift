//
//  memoDetailViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/05.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit
import CoreData

class memoDetailViewController: UIViewController {

    @IBOutlet var saveDate: UITextField!
    @IBOutlet var memoTitle: UITextField!
    @IBOutlet var memoContents: UITextView!
    
    var detailMemo: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let memo = detailMemo {
            let memoDate: Date? = memo.value(forKey: "memoDate") as? Date
            
            let formatter:DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unwrapDate = memoDate {
                saveDate.text = formatter.string(from: unwrapDate as Date)
            }
            
            memoTitle.text = memo.value(forKey: "memoTitle") as? String
            memoContents.text = memo.value(forKey: "memoContents") as? String
            
            
        }
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
