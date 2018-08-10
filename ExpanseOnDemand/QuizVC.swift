//
//  QuizVC.swift
//  ExpanseOnDemand
//
//  Created by Apple on 08/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit
import CoreData
class QuizVC: BaseViewController {
    @IBOutlet weak var quizTBL: UITableView!
    var screenType = screenTypeQuiz
    let utility = Utility()
    let manager = CoreDataManager()

   // var DataARR = CommonModel.sharedInstance.QuizArr
    var DataARR: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//       self.title
        manager.GetData(inputArr: &DataARR)
        if DataARR.count==0 {
            manager.saveData()
            manager.GetData(inputArr: &DataARR)

        }
        
        quizTBL.delegate=self
        quizTBL.dataSource=self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            
            manager.updateDataInCoreData(question: DataARR[indexPath.section], answer: cell.answerLBL.text!)
            manager.GetData(inputArr: &DataARR)
          self.quizTBL.reloadData()
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return DataARR.count
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return rowHeight
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let question = DataARR[section]
            
            let answerStr =  String(describing:question.value(forKeyPath: answerList)!)
            let answerArr = answerStr.components(separatedBy: ",")
            
            return answerArr.count
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let question = DataARR[section]
            return headerQuestion + String(describing: question.value(forKeyPath: questionText)!)
        }
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            // print(section)
            if screenType == screenTypeQuiz
            {
                return ""
            }
            else
            {
                let question = DataARR[section]
                return footerAnswer + String(describing: question.value(forKeyPath: answer)!)
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuizCell
            cell.selectionStyle = .none
            
            let question = DataARR[indexPath.section]
            
            let answerStr =  String(describing:question.value(forKeyPath: answerList)!)
            let answerArr = answerStr.components(separatedBy: ",")
            cell.answerLBL.text = String(describing:  answerArr[indexPath.row])
            if String(describing:question.value(forKeyPath: userAnswer)!) == String(describing:  answerArr[indexPath.row]) {
                cell.answerSelectionIMG.backgroundColor = .green
            }
            else
            {
                cell.answerSelectionIMG.backgroundColor = .gray
            }

           // show right or wrong answer
            if screenType == screenTypeScore && cell.answerLBL.text == String(describing:question.value(forKeyPath: userAnswer)!)
            {

                if String(describing:question.value(forKeyPath: userAnswer)!) == String(describing:question.value(forKeyPath: answer)!)
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
    
    

