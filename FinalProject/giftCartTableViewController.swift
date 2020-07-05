//
//  giftCartTableViewController.swift
//  FinalProject
//
//  Created by DigitalMedia-2017 on 2020/07/05.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit

class giftCartTableViewController: UITableViewController {

    var fetchedArray: [GiftData] = Array()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchedArray = []
        self.downloadDataFromServer()
    }
    
    func downloadDataFromServer() -> Void {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let userID = appDelegate.ID else { return }
        
        let urlString: String = "http://condi.swu.ac.kr/student/T11/login/giftCartTable.php"
        guard let requestURL = URL(string: urlString) else { return }
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = "POST"
        let restString: String = "id=" + userID
        request.httpBody = restString.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in guard responseError == nil else { print("Error: calling POST"); return; }
        guard let receivedData = responseData else {
        print("Error: not receiving Data"); return; }
        let response = response as! HTTPURLResponse
        if !(200...299 ~= response.statusCode) { print("HTTP response Error!"); return }
            do {
                if let jsonData = try JSONSerialization.jsonObject (with: receivedData,
                                                                    options:.allowFragments) as? [[String: Any]] {
                    for i in 0...jsonData.count-1 {
                        var newData: GiftData = GiftData()
                        var jsonElement = jsonData[i]
                        newData.giftCartNum = jsonElement["giftCartNum"] as! String
                        newData.userid = jsonElement["id"] as! String
                        newData.name = jsonElement["name"] as! String
                        newData.receiverName = jsonElement["receiverName"] as! String
                        newData.giftName = jsonElement["giftName"] as! String
                        newData.date = jsonElement["date"] as! String
                        self.fetchedArray.append(newData)
                    }
                    DispatchQueue.main.async { self.tableView.reloadData() } }
            } catch { print("Error: Catch") }
          }
          task.resume()
    }
    
    // 다음 화면으로 넘어가기 전 사전작업
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // InformationViewController로 가는 segue라면
        if segue.identifier == "listToinfo"{
            let destVC = segue.destination as! informationViewController // 다음 뷰컨트롤러는 informationViewController
            if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row{
                let data = fetchedArray[selectedIndex]
                destVC.image = UIImage(named:data.giftName + ".jpg")// 다음 뷰컨트롤러 이미지뷰에 현재 뷰의 이미지뷰의 이미지 넣기
                destVC.name = data.giftName // 뽑힌 선물의 이름을 다음 뷰컨트롤러로 넘기기
                destVC.title = "상품 상세보기" // 다음 뷰컨트롤러의 뷰타이틀 이름 지정
            }
            
        }
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let name = appDelegate.userName{
            self.title = name + "'s GiftList"
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gift Cell", for: indexPath)

        // Configure the cell...
        let item = fetchedArray[indexPath.row]
        cell.textLabel?.text = item.receiverName
        cell.detailTextLabel?.text = item.date

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
            let alert=UIAlertController(title:"정말 삭제 하시겠습니까?", message: "",preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .cancel, handler: { action in
            let urlString: String = "http://condi.swu.ac.kr/student/T11/login/deleteGiftCart.php"
            guard let requestURL = URL(string: urlString) else { return }
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            
            let data = self.fetchedArray[indexPath.row]
            let giftCartNum = data.giftCartNum
            let restString: String = "giftCartNum=" + giftCartNum
            request.httpBody = restString.data(using: .utf8)
            let session = URLSession.shared
                
            let task = session.dataTask(with: request) { (responseData, response, responseError) in
                guard responseError == nil else { return }
                guard let receivedData = responseData else { return }
                if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
            }
            task.resume()
            self.fetchedArray.remove(at: indexPath.row)
            print(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
