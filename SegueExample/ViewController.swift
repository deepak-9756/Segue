//
//  ViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

class ViewController: UIViewController  {
     
    @IBOutlet weak var tableView: UITableView!
    
    var users: [UserModel] = [UserModel(avtar: UIImage(systemName: "person")!, name: "Josh Hazalwood" , bio: "This is a first bio . This is a first bio . This is a first bio . This is a first bio . This is a first bio . This is a first bio ."), UserModel(avtar: UIImage(systemName: "person")!, name: "Ros Taylor" , bio: "This is a first bio . This is a first bio . This is a first bio . This is a first bio . This is a first bio . This is a first bio ."),UserModel(avtar: UIImage(systemName: "person")!, name: " Mitchell Starc" , bio: "This is a first bio . This is a first bio . This is a first bio .This is a first bio . This is a first bio . This is a first bio .")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // setup with xib tableview cell
        let nib = UINib(nibName: UserXibTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserXibTableViewCell.identifier)
        
        // setup with prograatic view cell
        tableView.register(ProgramaticTableViewCell.self, forCellReuseIdentifier:  ProgramaticTableViewCell.identifier)
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
    }
         
}
   
    

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UserXibTableViewCell.identifier , for: indexPath) as! UserXibTableViewCell
        cell.configure(user: user)
         
        return cell
    }
}
    
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
}

 
