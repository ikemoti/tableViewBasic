//
//  nextViewController.swift
//  tableViewBasic
//
//  Created by USER on 2020/01/20.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    
    var todoString =  String()
    
    
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoLabel.text = todoString


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
