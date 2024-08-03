//
//  UsersTableViewController.swift
//  SqLite
//
//  Created by swan on 2024/8/3.
//

import UIKit
import CoreData

class UsersTableViewController: UITableViewController {
    
    var dataArr: Array<AnyObject> = []
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        refreshData()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(2) as! UILabel
        let name = dataArr[indexPath.row].value(forKey: "name")
        let age = dataArr[indexPath.row].value(forKey: "age")
        
        label.text = "name: \(name!), age: \(age!)"

        return cell
    }
    
    // 获取某一个被点击的列表项
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = dataArr[indexPath.row] as! NSManagedObject
        
        var vc = storyboard?.instantiateViewController(withIdentifier: "UserContent") as! UserContentViewController
        // 传参
        vc.data = data
        // 启动一个 viewcontroller
        present(vc, animated: true)
    }
    
    func refreshData(){
        var f = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do {
            try dataArr = context!.fetch(f)
        } catch {
            
        }
        // 重新加载数据
        tableView.reloadData()
    }
    
    // 页面将要呈现时调用
    override func viewWillAppear(_ animated: Bool) {
        refreshData()
    }

    // 打开左滑删除
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // 删除操作
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            context.delete(dataArr[indexPath.row] as! NSManagedObject)
            do {
                try context.save()
            } catch {
                
            }
            
            refreshData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
