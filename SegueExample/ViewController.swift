//
//  ViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

struct User{
    let name: String
    var shoppingItems: [ShoppingItem]
}

struct ShoppingItem{
    let title: String
    let subtitle: String
    var image: UIImage
    var isSelected: Bool
    
}
 

class ViewController: UITableViewController {
    var users: [User] = [User(name: "Rohan", shoppingItems: [ShoppingItem(title: "Global", subtitle: "Network error", image: UIImage(systemName: "star") ?? UIImage(), isSelected: false)  ,ShoppingItem(title: "Shafari", subtitle: "Network not occure", image: UIImage(systemName: "star") ?? UIImage() , isSelected: false)]) ,
                         User(name: "Mohan", shoppingItems: [ShoppingItem(title: "Global", subtitle: "Network error", image: UIImage(systemName: "star") ?? UIImage() , isSelected: false) , ShoppingItem(title: "Chrom", subtitle: "Network Fix", image: UIImage(systemName: "star") ?? UIImage() , isSelected: false) ,ShoppingItem(title: "Shafari", subtitle: "Network not occure", image: UIImage(systemName: "star") ?? UIImage(), isSelected: false)]),
                         User(name: "Sohan", shoppingItems: [ShoppingItem(title: "Global", subtitle: "Network error", image: UIImage(systemName: "star") ?? UIImage() , isSelected: false) , ShoppingItem(title: "Chrom", subtitle: "Network Fix", image: UIImage(systemName: "star") ?? UIImage(), isSelected: false) ,ShoppingItem(title: "Shafari", subtitle: "Network not occure", image: UIImage(systemName: "star") ?? UIImage(), isSelected: false) ,
                                                             ShoppingItem(title: "Firefox", subtitle: "Network error", image: UIImage(systemName: "star") ?? UIImage() , isSelected: false)])
    ]
    
//    var shoppingItems: [ShoppingItem] = [ShoppingItem(title: "Global", subtitle: "Network error", image: UIImage(systemName: "star.fill") ?? UIImage()) , ShoppingItem(title: "Chrom", subtitle: "Network Fix", image: UIImage(systemName: "star.fill") ?? UIImage()) ,ShoppingItem(title: "Shafari", subtitle: "Network not occure", image: UIImage(systemName: "star.fill") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingItemDetailSegue"{
            let destination = segue.destination as! ShppingItemDetailViewController
            let shoppingItem = sender as! ShoppingItem
            destination.shoppingItem = shoppingItem
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return  users[section].shoppingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingSubtitleCell", for: indexPath)
        let shoppingData = users[indexPath.section].shoppingItems[indexPath.row]
        if #available(iOS 14, *){
            
            var content = cell.defaultContentConfiguration()
            content.text =  shoppingData.title
            content.secondaryText = shoppingData.subtitle
            content.image = shoppingData.image
            cell.contentConfiguration = content
            
        }else{
            
            cell.textLabel?.text = shoppingData.title

            cell.detailTextLabel?.text = shoppingData.subtitle
            cell.imageView?.image = shoppingData.image
        }
        
        
        
        return cell
        
        }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return users[section].name
    }
   
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "number of shopping items are \(users[section].shoppingItems.count)"

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        
//        users[indexPath.section].shoppingItems[indexPath.row].isSelected = !users[indexPath.section].shoppingItems[indexPath.row].isSelected
//        
//        users[indexPath.section].shoppingItems[indexPath.row].image = users[indexPath.section].shoppingItems[indexPath.row].isSelected ? UIImage(systemName: "star.fill")! : UIImage(systemName: "star")!
        
        let shoppingItem = users[indexPath.section].shoppingItems[indexPath.row] as ShoppingItem
        
        performSegue(withIdentifier: "ShoppingItemDetailSegue", sender: shoppingItem)
        tableView.reloadData()
    }
    
    
    }
   
    
    

 
