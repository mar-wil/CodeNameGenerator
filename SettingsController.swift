//
//  SettingsController.swift
//  CodeName
//
//  Created by Maree Williams on 28/09/2016.
//  Copyright © 2016 Maree Williams. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
   
    @IBOutlet weak var firstWordLab: UILabel!
    @IBOutlet weak var secondWordLab: UILabel!
    @IBOutlet weak var thirdWordLab: UILabel!

 
    @IBOutlet weak var firstWordPicker: UIPickerView!
    @IBOutlet weak var secondWordPicker: UIPickerView!
    @IBOutlet weak var thirdWordPicker: UIPickerView!
    
    let dataSourceArray = Array(dataSourceDict.keys)
    var pickerData:[String] = [String]()
 
    
   
    var row1 = 0
    var row2 = 0
    var row3 = 0
    var category1:String = ""
    var category2:String = ""
    var category3:String = ""
    
    func setArray (){
     
        self.pickerData = dataSourceArray//in dictionary format
        
    }
     //MARK: Standard functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setArray()
        self.firstWordPicker.dataSource = self
        self.firstWordPicker.delegate = self
        self.secondWordPicker.dataSource = self
        self.secondWordPicker.delegate = self
        self.thirdWordPicker.dataSource = self
        self.thirdWordPicker.delegate = self
        
    
              //set the value of the pickerview rwo so that the current value comes up
            
            firstWordPicker.selectRow(rowOne, inComponent: 0, animated: false)
            secondWordPicker.selectRow(rowTwo, inComponent: 0, animated: false)
            thirdWordPicker.selectRow(rowThree, inComponent: 0, animated: false)
            
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     //MARK: Extra functions
    func selectRow(_ row: Int,
                   inComponent component: Int,
                   animated: Bool){
        
        
    }
  
     //MARK: Screen setup
    func setView(){
 
        firstWordPicker.isHidden = false
        firstWordLab.isHidden  = false
       
        
        row1 = rowOne
        row2 = rowTwo
        row3 = rowThree
        
        category1 = categoryOne
        category2 = categoryTwo
        category3 = categoryThree
        
        switch wordNumber {
            
        case 1: //One word
            secondWordPicker.isHidden  = true
            secondWordLab.isHidden = true
            thirdWordLab.isHidden = true
            thirdWordPicker.isHidden = true
             if isFirstTime == true{
            row2 = 0
            row3 = 0
            }
       
        case 2: //Two words
            secondWordPicker.isHidden  = false
            secondWordLab.isHidden = false
            thirdWordLab.isHidden = true
            thirdWordPicker.isHidden = true
            if isFirstTime == true{
            row3 = 0
            }
        
        default: //three words
            secondWordPicker.isHidden  = false
            secondWordLab.isHidden = false
            thirdWordLab.isHidden = false
            thirdWordPicker.isHidden = false
        }
    }
    
     //MARK: Buttons
     @IBAction func cancelBtnClicked(_ sender: AnyObject) {
         isCancelPressed = true
        if isFirstTime == true{
        categoryOne = ""
        categoryTwo = ""
        categoryThree = ""
        row1 = 0
        row2 = 0
        row3 = 0
       
        }
        else{
           row1 = rowOne
           row2 = rowTwo
           row3 = rowThree
        }
     }

    @IBAction func doneBtnClicked(_ sender: AnyObject) {
        isCancelPressed = false
        isFirstTime = false
     
       
        switchCall()
    }
    
     //MARK: Set global variables
    
    func switchCall (){
        
        if category1 .isEmpty && categoryOne .isEmpty {
            category1 = "Animals"
        }
        if category2 .isEmpty && categoryTwo .isEmpty {
            category2 = "Animals"
        }
        if category3 .isEmpty && categoryThree .isEmpty {
            category3 = "Animals"
        }

        
      
        if category1 .isEmpty {
            category1 = categoryOne
        }
        if category2 .isEmpty {
            category2 = categoryTwo
        }
        if category3 .isEmpty {
            category3 = categoryThree
        }
        switch wordNumber {
            
        case 1:
            categoryOne = category1
            categoryTwo = ""
            categoryThree = ""
            row3 = 0
            row2 = 0
            rowOne = row1
            
        case 2:
            categoryOne = category1
            categoryTwo = category2
            categoryThree = ""
            row3 = 0
            rowTwo = row2
            rowOne = row1
            
        default:
            categoryOne = category1
            categoryTwo = category2
            categoryThree = category3
            rowTwo = row2
            rowOne = row1
            rowThree = row3
        }

        
    }
    
     //MARK: Pickerview functions
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        return dataSourceDict.count;
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       
        return dataSourceArray[row] as String
        
        
    }
  
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent: Int){
    
       
        
        category1 = pickerData[firstWordPicker.selectedRow(inComponent: 0)]
        category2 = pickerData[secondWordPicker.selectedRow(inComponent: 0)]
        category3 = pickerData[thirdWordPicker.selectedRow(inComponent: 0)]
        
     
    
        
        row1 = firstWordPicker.selectedRow(inComponent: 0)
        row2 = secondWordPicker.selectedRow(inComponent: 0)
        row3 = thirdWordPicker.selectedRow(inComponent: 0)
        
        
   
       
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.purple])
        return myTitle
    }

 
}
