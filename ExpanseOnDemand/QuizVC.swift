//
//  QuizVC.swift
//  ExpanseOnDemand
//
//  Created by Apple on 08/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class QuizVC: BaseViewController {
    @IBOutlet weak var quizTBL: UITableView!
    var screenType = screenTypeQuiz
    let utility = Utility()
    var DataARR = CommonModel.sharedInstance.QuizArr
    override func viewDidLoad() {
        super.viewDidLoad()
//       self.title
        quizTBL.delegate=self
        quizTBL.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    extension QuizVC:UITableViewDelegate,UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return headerHeight
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat  {
            if screenType == screenTypeQuiz
            {
                return zeroHeight
            }
            else
            {
                return footerHeight
            }
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if screenType == screenTypeScore
            {
                return
            }
            let cell = tableView.cellForRow(at: indexPath) as! QuizCell
            DataARR[indexPath.section][userAnswer]=cell.answerLBL.text
            
            CommonModel.sharedInstance.QuizArr=DataARR
            // print(DataARR[indexPath.section])
            //  print(CommonModel.sharedInstance.QuizArr)
            self.quizTBL.reloadData()
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return rowHeight
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let answerArr  = DataARR[section][answerList] as! [[String : Any]]
            return answerArr.count
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            //  print(section)
            return "Question: " + String(describing: DataARR[section][questionText]!)
        }
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            // print(section)
            if screenType == screenTypeQuiz
            {
                return ""
            }
            else
            {
                return "Answer: " + String(describing: DataARR[section][answer]!)
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuizCell
            cell.selectionStyle = .none
            let answerArr  = DataARR[indexPath.section][answerList] as! [[String : Any]]
            cell.answerLBL.text = String(describing:  answerArr[indexPath.row][answerText]!)
            if String(describing: DataARR[indexPath.section][userAnswer]!) == String(describing:  answerArr[indexPath.row][answerText]!) {
                cell.answerSelectionIMG.backgroundColor = .green
            }
            else
            {
                cell.answerSelectionIMG.backgroundColor = .gray
            }
            let questionDict = DataARR[indexPath.section]
           // show right or wrong answer
            if screenType == screenTypeScore && cell.answerLBL.text == String(describing: questionDict[userAnswer]!)
            {
                
                if String(describing: questionDict[userAnswer]!) == String(describing: questionDict[answer]!)
                {
                    cell.backgroundColor = .green
                }
                else
                {
                    cell.backgroundColor = .red
                }
            }
            else
            {
                cell.backgroundColor = .white
            }
            return cell
        }
        
        

    }
    
    

