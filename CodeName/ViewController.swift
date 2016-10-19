//
//  ViewController.swift
//  CodeName
//
//  Created by Maree Williams on 18/09/2016.
//  Copyright © 2016 Maree Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     //MARK:
    @IBOutlet weak var word3Label: UILabel!
    @IBOutlet weak var word2Label: UILabel!
    @IBOutlet weak var word1Label: UILabel!
    
  
    @IBOutlet weak var changeWord3Cat: UIButton!
    
    @IBOutlet weak var setAllWordCat: UIButton!
    @IBOutlet weak var generateName: UIButton!
    
    @IBOutlet weak var numberOfWords: UISegmentedControl!
  
    
     //MARK: Standard functions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Extra functions
    
    
    //Chooses the number of words
    @IBAction func wordNumberChanged(_ sender: AnyObject) {
     //    print ("action \(isFirstTime)")
        switch numberOfWords.selectedSegmentIndex
        {
        case 0: //One Word
            wordNumber = 1
            if isFirstTime{
             setAllWordCat.setTitle("Set Word Category", for: .normal)
            }
            else{
            setAllWordCat.setTitle("Change Word Category", for: .normal)
               
            }
        case 1: // Two words
            wordNumber = 2
             if isFirstTime{
             setAllWordCat.setTitle("Set Word Categories", for: .normal)
            }
             else {
            setAllWordCat.setTitle("Change Word Categories", for: .normal)
            
            }
        default: //Three words
            wordNumber = 3
             if isFirstTime{
             setAllWordCat.setTitle("Set Word Categories", for: .normal)
            }
             else{
              setAllWordCat.setTitle("Change Word Categories", for: .normal)
            }
        }
   mainView()
    }
    
 //MARK: Set up views
    //View on opening the APP
    
    func firstView (){
        
        numberOfWords.isHidden = false
   
       
        word1Label.isHidden = true
 
        word2Label.isHidden = true
    
        word3Label.isHidden = true
        generateName.isHidden = true
        
    }
    
    //The view once the categories are chosen
    
    func mainView (){
 
        
        if isFirstTime == true{
            firstView()
            
        }
        else {
      
         generateName.isHidden = false
    
      
      
           switch wordNumber {
           case 1:
            numberOfWords.isHidden = false
     
            word1Label.isHidden = false
            word2Label.isHidden = true
            word3Label.isHidden = true
            word1Label.text = "Word 1 Category: \(categoryOne)"
            setAllWordCat.setTitle("Change Word Category", for: .normal)
           
        
           case 2:
            numberOfWords.isHidden = false
        
            word1Label.isHidden = false
            word2Label.isHidden = false
            
            word3Label.isHidden = true
           setAllWordCat.setTitle("Change Word Categories", for: .normal)
           
            word1Label.text = "Word 1 Category: \(categoryOne)"
            if categoryTwo .isEmpty {
               word2Label.text = "Word 2 Category: Click button to set"
               generateName.isHidden = true
            }
            else{
            word2Label.text = "Word 2 Category: \(categoryTwo)"
                
            }
           
          default:
            
            numberOfWords.isHidden = false
        
            word1Label.isHidden = false
            word2Label.isHidden = false
         
            word3Label.isHidden = false
           
             setAllWordCat.setTitle("Change Word Categories", for: .normal)
            word1Label.text = "Word 1 Category: \(categoryOne)"
            if categoryTwo .isEmpty {
                word2Label.text = "Word 2 Category: Click button to set"
                generateName.isHidden = true
            }
            else{
                word2Label.text = "Word 2 Category: \(categoryTwo)"
            }
            if categoryThree .isEmpty {
              word3Label.text = "Word 3 Category: Click button to set"
              generateName.isHidden = true
            }
            else{
            word3Label.text = "Word 3 Category: \(categoryThree)"
            }
        }
        }
        
    }
    
 //MARK: Unwind
    @IBAction   func unwind(for unwindSegue: UIStoryboardSegue, ViewController subsequentVC: SettingsController) {
        if (isCancelPressed == true) && (isFirstTime == true){
             firstView()
        }
        else {
   
                mainView()
                
        
        }
    }
    
   //?? not used
    
    @IBAction func generateBtnPressed(_ sender: AnyObject) {
        
      
      
     
       //   if (categoryThree.isEmpty) || (categoryTwo.isEmpty) || (categoryOne.isEmpty){
      //       errorAlertScreenCalled()
   
   //   }
        

            
        
        
      
    }
 
    func errorAlertScreenCalled () {
        
        let alertController = UIAlertController(title: "No Category Set", message:
            "Please set a category", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
 

}

