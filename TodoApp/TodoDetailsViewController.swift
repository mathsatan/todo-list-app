//
//  TodoDetailsViewController.swift
//  TodoApp
//
//  Created by max kryuchkov on 24.08.2023.
//

import UIKit

class TodoDetailsViewController: UIViewController {

    var item: String = ""
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = item
    }
}
