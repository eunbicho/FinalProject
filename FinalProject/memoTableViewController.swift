//
//  memoTableViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/04.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit
import CoreData

class memoTableViewController: UITableViewController {
    
    var memo: [NSManagedObject] = []

    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
        
        do {
            memo = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memo Cell", for: indexPath)

        // Configure the cell...
        let memoObject = memo[indexPath.row]
        
        // cell 왼쪽 text
        cell.textLabel?.text = memoObject.value(forKey: "memoTitle") as? String
        
        // cell 오른쪽 detail text
        let memoDate:Date? = memoObject.value(forKey: "memoDate") as? Date
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        
        if let unwrapDate = memoDate{
            cell.detailTextLabel?.text = formatter.string(from: unwrapDate as Date)
            
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // core data 내의 해당 자료 삭제
            let context = getContext()
            context.delete(memo[indexPath.row])
            do{
                try context.save()
                print("deleted!")
            } catch let error as NSError {
                print("Could not delete \(error), \(error.userInfo)")
            }
            // 배열에서 해당 자료 삭제
            memo.remove(at: indexPath.row)
            // 테이블뷰 cell 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
            
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailView"{
            if let destination = segue.destination as? memoDetailViewController{
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.detailMemo = memo[selectedIndex]
                }
            }
        }
        
    }
    

}
