//
//  ViewController.swift
//  BasicReference
//
//  Created by Sierra 4 on 05/04/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variables
    var items = [String]()
    //outlets
    @IBOutlet weak var viewWhenTableViewEmpty: UIView!
    @IBOutlet weak var tableViewItems: UITableView!
    func checkStatusOfItems() {
        if items.count == 0 {
            //self.view.layer.zPosition = 1;
            viewWhenTableViewEmpty.layer.zPosition = 1
            
        }
        else {
            super.view.sendSubview(toBack: viewWhenTableViewEmpty)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewItems.delegate = self
        tableViewItems.dataSource = self
        items.append("My Name")
        checkStatusOfItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnAddItemClick(_ sender: Any) {
        let alert = UIAlertController(title: "Alert Title",
                                      message: "Alert message",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK",
                               style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                                
                                if let alertTextField = alert.textFields?.first, alertTextField.text != nil {
                                    
                                    //print("And the text is... \(alertTextField.text!)!")
                                    self.displayText(alertTextField.text!)
                                }
                                
                                
        }
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        
        alert.addTextField { (textField: UITextField) in
            
            textField.placeholder = "Text here"
            
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
//        tableViewItems.beginUpdates()
//        tableViewItems.reloadData()
//        checkStatusOfItems()

    }
    func displayText(_ text: String) {
        print("The text is  : \(text)")
        items.append(text)
        //tableViewItems.reloadData()
        let index = items.count - 1
        print("The items count is : \(items.count)")
        tableViewItems.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        //checkStatusOfItems()
        
    }
    func deleteRowTableView(_ indexOfRow: IndexPath) {
        items.remove(at: indexOfRow.row)
        tableViewItems.deleteRows(at: [indexOfRow] , with : .automatic)

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ItemTableViewCell
        tableCell.lblItemName.text = items[indexPath.row]
        return tableCell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let complete =  UITableViewRowAction(style: .normal, title: "Complete")
        { action, index in
            print("more button tapped")
            self.deleteRowTableView(index)
        }
        complete.backgroundColor = UIColor.lightGray
        return [complete]
    }
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if(editingStyle == UITableViewCellEditingStyle.delete)
//        {
//            items.remove(at: indexPath.row)
//            tableViewItems.deleteRows(at: [indexPath] , with : .automatic)
//            //tableViewItems.reloadData()
//        }
//    }

    
}
