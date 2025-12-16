//
//  ViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

class ViewController: UIViewController  {
     
    @IBOutlet weak var tableView: UITableView!
    
    var users: [UserModel] = [UserModel(avtar: UIImage(systemName: "person")!, name: "Josh Hazalwood"), UserModel(avtar: UIImage(systemName: "person")!, name: "Ros Taylor"),UserModel(avtar: UIImage(systemName: "person")!, name: " Mitchell Starc")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
 
    }
         
}
   
    

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell" , for: indexPath) as! UserTabelViewCell
        cell.avatarImage.image = user.avtar
        cell.userName.text = user.name
        return cell
    }
}
    
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

 
