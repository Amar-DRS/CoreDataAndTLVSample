//
//  ViewController.swift
//  ExpanseOnDemand
//
//  Created by Apple on 07/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
         CommonModel.sharedInstance.QuizArr = DummyData.getDummyDataForQuestionAnswerList()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

