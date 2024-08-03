//
//  UserContentViewController.swift
//  SqLite
//
//  Created by swan on 2024/8/3.
//

import UIKit
import CoreData

class UserContentViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfAge: UITextField!
    var data:NSManagedObject!
    
    @IBAction func submit(_ sender: Any) {
        data.setValue(tfName.text, forKey: "name")
        data.setValue(tfAge.text?.codingKey.intValue, forKey: "age")
        do {
            try data.managedObjectContext?.save()
            dismiss(animated: true)
        } catch {
            
        }
        
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfName.text = data.value(forKey: "name") as! String
        tfAge.text = "\(data.value(forKey: "age")!)"
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
