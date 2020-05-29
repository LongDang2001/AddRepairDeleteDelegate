//
//  ViewController.swift
//  AddRepairDeleteDelegate
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var foodterView: UIView!
    @IBOutlet weak var heightView: UIView!
    var indexTo: Int?
    var arrayName: [String] = ["mdfi", "dd"]
    
    var haveNoData: Bool = true {
        didSet {
            if haveNoData == true {
                tableView.tableFooterView = foodterView
            } else {
                tableView.tableFooterView = heightView
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        indexTo = nil
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (arrayName.count == 0) {
            haveNoData = true
        } else {
            haveNoData = false
        }
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        print("VIEW 1 WILL DIS APPEART")
//    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        indexTo = nil
//        tableView.reloadData()
//        print("VIEW 1 DID DIS APPEART")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? TableViewCell {
            cell.textLabelCell.text = arrayName[indexPath.row]
            return cell
        }
        return TableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyboardData = (storyboard?.instantiateViewController(identifier: "storyboard") as? SecondViewController) else { return }
        storyboardData.dataSecond = arrayName[indexPath.row]
        indexTo = indexPath.row
        navigationController?.pushViewController(storyboardData, animated: true)
        storyboardData.delegate = self
        tableView.reloadData()
        // cách lấy index ra ngoài func để lấy biến toàn cục, thì ta gán giá trị của cái index cho cái biến khai báo ngoài func.
    }
    
    
    @IBAction func addToSecond() {
        if let addStoryboard = storyboard?.instantiateViewController(identifier: "storyboard") as? SecondViewController {
            navigationController?.pushViewController(addStoryboard, animated: true)
            addStoryboard.delegate = self
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        if (arrayName.count == 0) {
            haveNoData = true
        } else {
            haveNoData = false
        }
    }
}

extension ViewController: passDataDelegate {
    func passData(data: String) {
        
        if indexTo != nil {
            arrayName[indexTo!] = data
        } else {
            arrayName.append(data)
        }
        tableView.reloadData()
    }
}
