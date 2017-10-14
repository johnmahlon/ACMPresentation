//
//  MainViewController.swift
//  ACMToDoList
//
//  Created by John Peden on 10/5/17.
//  Copyright © 2017 John Peden. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet var mainTableView: UITableView!
  var data: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mainTableView.dataSource = self
    mainTableView.delegate = self
  }
  
  @IBAction func addItem(_ sender: Any) {
    let alert = UIAlertController(title: "Alert", message: "Add Item", preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addTextField { (textField: UITextField!) in
      textField.placeholder = "Enter item:"
      textField.isSecureTextEntry = false
    }
    
    
    alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default) {
      [weak alert] (_) in
      let textField = alert?.textFields![0]
      if let text = textField?.text {
        self.data.append(text)
        self.mainTableView.reloadData()
      }
    })
    self.present(alert, animated: true, completion: nil)
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
    cell.itemLabel.text = data[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
}

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if (editingStyle == .delete) {
      data.remove(at: indexPath.row)
      mainTableView.reloadData()
    }
  }
}



