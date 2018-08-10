//
//  ViewController.swift
//  ExpanseOnDemand
//
//  Created by Apple on 07/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
  let  utility = Utility()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func taskSecondBTNAction(_ sender: Any) {
        utility.getSubstringFromString()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

