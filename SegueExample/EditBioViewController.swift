//
//  EditBioViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

class EditBioViewController: UIViewController {

    @IBOutlet weak var editBioTextfield: UITextField!
    var placeholderText =  "Placeholder"
    override func viewDidLoad() {
        super.viewDidLoad()

        editBioTextfield.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        editBioTextfield.layer.cornerRadius = 12
        editBioTextfield.layer.borderColor = UIColor.gray.cgColor
        editBioTextfield.layer.borderWidth = 2
    }
    
    @IBAction func editBioSubmitBUtton(_ sender: Any) {
        guard let bioText = editBioTextfield.text else{
            return
        }
        let value: [String: Any] = ["bio": bioText]
        let testObject = "Test Object here"
        //NotificationCenter.default.post(name: updateBioNotificationKey, object: ViewController.self, userInfo: value )
        NotificationCenter.default.post(name: updateBioNotificationKey, object: testObject, userInfo: value )
        

//        object: ViewController.self ye line object ka batai hai ki hame isse data mila hai for sense
        
        
        dismiss(animated: true)
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

extension EditBioViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        if textField.textColor == UIColor.lightGray{
            textField.text = nil
            textField.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        if let text =  textField.text , text.count == 0{
            
            textField.textColor = UIColor.lightGray
            textField.text = placeholderText
        }
    }
   
    
}
