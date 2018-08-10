//
//  CoraDataManager.swift
//  ExpanseOnDemand
//
//  Created by Amar DRS on 8/10/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit
import CoreData
class CoreDataManager: NSObject {

    func GetData(inputArr: inout [NSManagedObject])  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: quizEntity)
        do {
            let questions = try managedContext.fetch(fetchRequest)
            //  print(DataARR)
            
            
            if let questions = questions as? [NSManagedObject] {
                 inputArr = questions
              //  print(DataARR)
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func saveData() {
        
        let arr = DummyData.getDummyDataForQuestionAnswerList()
        
        for question in arr
        {
            saveDataInCoreData(question: question)
        }
    }
    
    
    func saveDataInCoreData(question:[String:Any]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: quizEntity,
                                                in: managedContext)!
        
        
        
        let Question = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        
        Question.setValue(question[questionText], forKeyPath:questionText)
        Question.setValue(question[answer], forKeyPath: answer)
        Question.setValue(question[answerList], forKeyPath: answerList)
        Question.setValue(question[userAnswer], forKeyPath:userAnswer)
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func updateDataInCoreData(question:NSManagedObject, answer:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        question.setValue(answer, forKeyPath:userAnswer)
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
