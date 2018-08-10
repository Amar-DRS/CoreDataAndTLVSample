//
//  QuizSelectionVC.swift
//  ExpanseOnDemand
//
//  Created by amarjeet patel on 08/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class QuizSelectionVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
        
        if segue.identifier == "Score"
        {
            let controller = segue.destination as! QuizVC
            controller.screenType = screenTypeScore
        }
       else if segue.identifier == "PlayQuiz"
        {
            let controller = segue.destination as! QuizVC
            controller.screenType = screenTypeQuiz
        }
    }


}
