//
//  ViewController.swift
//  TodoApp
//
//  Created by max kryuchkov on 24.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var button: UIButton!
    
    let data: [String] = ["todo 1", "todo 2", "todo 3"]
    
    @IBAction func buttonAction(_ sender: UIButton) {
        print("did tap!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = .brown
        view.backgroundColor = .gray
        print("custom viewcontroller")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = item
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = indexPath.item
        print("number \(currentIndex)")
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "TodoDetailsViewController") as? TodoDetailsViewController else {
            return
        }
        detailsViewController.item = data[currentIndex]
        
        self.present(detailsViewController, animated: true)
    }
}

