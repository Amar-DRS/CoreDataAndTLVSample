//
//  DummyData.swift
//  ExpanseOnDemand
//
//  Created by Apple on 07/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class DummyData: NSObject {
  class func getDummyDataForQuestionAnswerList()-> [[String:Any]]
    {
        
        
       
        let answer1 = "Answer 1"
        let answer2 = "Answer 2"
        let answer3 = "Answer 3"
        let answer4 = "Answer 4"
        let answer5 = "Answer 5"

   
        
        
        let Question1 : [String:Any]  = [
            questionText: "Question 1",
            answer: "Answer 1",
            userAnswer: "",
            answerList :answer1
        ]
        let Question2 : [String:Any]  = [
            questionText: "Question 2",
            answer: "Answer 2",
            userAnswer: "",
            answerList :answer1 + "," + answer2
        ]
        let Question3 : [String:Any]  = [
            questionText: "Question 3",
            answer: "Answer 3",
            userAnswer: "",
            answerList :answer1 + "," + answer2 + "," + answer3
        ]
        let Question4 : [String:Any]  = [
            questionText: "Question 4",
            answer: "Answer 4",
            userAnswer: "",
            answerList :answer1 + "," + answer2 + "," + answer3 + "," + answer4

        ]
        let Question5 : [String:Any]  = [
            questionText: "Question 5",
            answer: "Answer 5",
            userAnswer: "",
            answerList :answer1 + "," + answer2 + "," + answer3 + "," + answer4 + "," + answer5

        ]
        
        
        
        var QAArray = [[String : Any]]()
        QAArray.append(Question1)
        QAArray.append(Question2)
        QAArray.append(Question3)
        QAArray.append(Question4)
        QAArray.append(Question5)
        
      
        return QAArray
    }
}
