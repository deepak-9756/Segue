//
//  EditProfileViewController.swift
//  SegueExample
//
//  Created by Merger on 01/12/25.
//

import UIKit

class EditNameViewController: UIViewController {

    @IBOutlet weak var editNameTextField: UITextField!
    var placeHolderText: String = ""
    weak var vc: VCProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        editNameTextField.text = placeHolderText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let pfvc = vc ,
        let name = editNameTextField.text else {
            return
        }
        pfvc.update(name: name)
        dismiss(animated: true)
    }
    
    

}
