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
    @IBOutlet weak var labelProfile: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    var currentName = "Deepak"
    
    var currentBio = "My first Bio"
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(updateBio(_:) ), name: updateBioNotificationKey, object: ViewController.self)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBio(_:) ), name: updateBioNotificationKey, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func updateBio(_ notification: Notification){
        
        if  let object = notification.object , let testString = object as? String{
            print(testString )
        }
        if let userInfo = notification.userInfo{
            if let bio = userInfo["bio"] as? String{
                currentBio = bio
                labelProfile.text = currentBio
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditnameSegue"{
            let destinationVC = segue.destination as! EditNameViewController
            destinationVC.placeHolderText = currentName
            destinationVC.vc = self
        }
    }
    
//    func updateName(name: String){
//        userLabel.text = name
//        currentName = name
//    }

    @IBAction func editNameBUtton(_ sender: Any) {
        performSegue(withIdentifier: "EditnameSegue", sender: nil)
        
    }
    @IBAction func editBioButton(_ sender: Any) {
        
        let mainStoryBoard =  UIStoryboard(name: "Main", bundle: nil)
        let bioVC = mainStoryBoard.instantiateViewController(withIdentifier: "EditBioVc") as! EditBioViewController
        bioVC.placeholderText = currentBio
        
        present(bioVC, animated: true)
    }
    
}


extension ViewController : VCProtocol{
     
    
    func update(name: String){
        userLabel.text = name
        currentName = name
    }
    
     
}
