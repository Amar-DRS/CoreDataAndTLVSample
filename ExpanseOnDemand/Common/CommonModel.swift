//
//  CommonModel.swift
//  eManager
//
//  Created by amarjeet patel on 30/05/18.
//  Copyright © 2018 amarjeet patel. All rights reserved.
//

import Foundation

    
    class CommonModel {
        var QuizArr = [[String : Any]]()
        static let sharedInstance: CommonModel = { CommonModel() }()
    }
    

