//
//  ViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

 
 

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    
     
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingItem: [String] = ["Apple" , "Orange" , "Milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  shoppingItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath)
        let shoppingItem = shoppingItem[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = shoppingItem
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
    }
    
         
}
   
    
    

 
