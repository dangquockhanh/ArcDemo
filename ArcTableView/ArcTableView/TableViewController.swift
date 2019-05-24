//
//  TableViewController.swift
//  ArcTableView
//
//  Created by Đặng Khánh  on 5/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var noContentView: UIView!
    
    var numbers = [Int](0...4) //1
    
    var characterDatasource = CharactersDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        noContentView.frame = view.bounds
        characterDatasource.noContenView = noContentView
        
    }
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        tableView.dataSource = sender.isOn ? self : characterDatasource
        tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = String(numbers[indexPath.row])
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numbers.remove(at: indexPath.row) // xoá tại vị trí hàng
            if numbers.isEmpty {
                tableView.tableFooterView = noContentView
            }else {
                tableView.tableFooterView = UIView()
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
}

// quản lý hiển sau khi ấn switch
class CharactersDataSource: NSObject, UITableViewDataSource {
    weak var noContenView: UIView?
    var character = ["a", "b", "c"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = character[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            character.remove(at: indexPath.row)
            if character.isEmpty {
                tableView.tableFooterView = noContenView
            }else {
                tableView.tableFooterView = UIView()
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    
}
