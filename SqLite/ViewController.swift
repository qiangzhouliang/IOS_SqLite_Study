//
//  ViewController.swift
//  SqLite
//
//  Created by swan on 2024/8/3.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var row = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        row.setValue("jikexueyuan", forKey: "name")
        row.setValue(1, forKey: "age")
        // 保存
        do {
            try context.save()
        } catch {
            
        }
        
    }


}

