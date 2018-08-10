//
//  Utility.swift
//  eManager
//
//  Created by amarjeet patel on 18/05/18.
//  Copyright © 2018 amarjeet patel. All rights reserved.
//
import UIKit

class Utility: NSObject {
    // MARK: Screen Size Properties
    // Screen width.
    var TLVTagString = TLVCodedString
    var TLVSubTagString = ""

    var TagArr = [[String:Any]]()

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
   
    // MARK: Show Alert
    func showAlert(titleSTR:String,messageSTR:String,controller:UIViewController) {
        let alert = UIAlertController(title: titleSTR, message: messageSTR, preferredStyle: UIAlertControllerStyle.alert)
        
        let okaction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler:nil)
        alert.addAction(okaction)
        controller.present(alert, animated: true, completion: nil)
    }
    // MARK: String Length
    func CheckStringLength(inputString:String , length:NSInteger) -> Bool {
        if inputString.count >= length {
            return true
        }
        else
        {
            return false
        }
    }
    // MARK: Email Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }


    
    func MakeCircularView(inputView:UIView)
    {
        inputView.layer.masksToBounds = true
        inputView.layer.cornerRadius = inputView.frame.height/2
        inputView.clipsToBounds = true
    }
   
    func MakeCircularViewWithBorder(inputView:UIView)
    {
        inputView.layer.masksToBounds = true
        inputView.layer.cornerRadius = inputView.frame.height/2
        inputView.clipsToBounds = true
        inputView.layer.borderWidth=2.0
        inputView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
  
   
    func getSubstringFromString()  {

        while TLVTagString.count>0 {
            let resultTagTuple = getTagAndValueFromString(inputString: TLVTagString, isSubTag: false)
            
           // print(resultTagTuple)
            if resultTagTuple.tagvalue.hasPrefix("0") && resultTagTuple.tagvalue.count>5
               {
                TLVSubTagString = resultTagTuple.tagvalue
                while TLVSubTagString.count>0 {
                    _ =   getTagAndValueFromString(inputString: TLVSubTagString, isSubTag: true)
                  //  print(resultSubTagTuple)

                }
        }
       
    }
   print(TagArr)
    }
    
    
    @discardableResult
    func getTagAndValueFromString(inputString:String,isSubTag:Bool)->(tag:String,length:Int,tagvalue:String)  {
            //  start tag index
            var TagDict = [String:Any]()

            let tagStart = inputString.startIndex
            
            //  end tag index
            let tagEnd = inputString.index(tagStart, offsetBy: 2)
            
            // string for tag
            let tagSubstring = inputString[tagStart..<tagEnd]
            
            //  start length index
            let lengthStart = inputString.index(tagStart, offsetBy: 2)
            
            //  end length index
            let lengthEnd = inputString.index(lengthStart, offsetBy: 2)
            
            // string for length
            let lengthSubstring = inputString[lengthStart..<lengthEnd]
            let valueLength = Int(lengthSubstring)
            
            // value start tag
            let valueStart = inputString.index(lengthEnd, offsetBy: 0)
            
            // value end tag
            let valueEnd = inputString.index(valueStart, offsetBy: valueLength!)
            
            // tag value
            let tagValue = inputString[valueStart..<valueEnd]
            
            // remove saved tag value
        if isSubTag==false
        {
            TagDict[tagKey]="tag" + tagSubstring
            TagDict[valueLengthKey]=valueLength
            TagDict[valueKey]=tagValue

            let range = inputString.range(of: inputString[tagStart..<valueEnd])
            TLVTagString.replaceSubrange(range!, with: "")
        }
        else
        {
            TagDict[tagKey]="subtag" + tagSubstring
            TagDict[valueLengthKey]=valueLength
            TagDict[valueKey]=tagValue
            
            let range = inputString.range(of: inputString[tagStart..<valueEnd])
            TLVSubTagString.replaceSubrange(range!, with: "")

        }
        TagArr.append(TagDict)
        return (String(tagSubstring),valueLength!,String(tagValue))
    }
    
    func removeStringWithString(inputSTR:String)->(String)
    {
        let myStringArr = inputSTR.components(separatedBy: ".")
        return myStringArr[0]
    }
   

}
