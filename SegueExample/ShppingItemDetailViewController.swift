//
//  ShppingItemDetailViewController.swift
//  SegueExample
//
//  Created by Merger on 03/12/25.
//

import UIKit

class ShppingItemDetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    var shoppingItem: ShoppingItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        if  let shoppingItem = shoppingItem{
            detailLabel.text = shoppingItem.title
        }

        // Do any additional setup after loading the view.
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
