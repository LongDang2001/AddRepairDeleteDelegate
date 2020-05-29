//
//  SecondViewController.swift
//  AddRepairDeleteDelegate
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
protocol passDataDelegate {
    func passData(data: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldSecond: UITextField!
    var dataSecond: String?
    var delegate: passDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataSecond != nil {
            textFieldSecond.text = dataSecond
        }
    }
    
    @IBAction func save() {
        guard let dataDelegate = textFieldSecond.text else { return }
        if dataDelegate.trimmingCharacters(in: .whitespaces).isEmpty {
            
        } else {
            self.delegate?.passData(data: dataDelegate)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
