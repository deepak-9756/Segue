//
//  ViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

let updateBioNotificationKey = Notification.Name("com.fullstactuts.updatebio")

protocol VCProtocol: AnyObject{
    func update(name: String)
}

class ViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func actionButton(_ sender: Any) {
        performSegue(withIdentifier: "NextVCSegue", sender: nil)
    }
    
    
}


 
