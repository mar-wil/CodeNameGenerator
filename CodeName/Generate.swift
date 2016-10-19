//
//  Generate.swift
//  CodeName
//
//  Created by Maree Williams on 1/10/2016.
//  Copyright © 2016 Maree Williams. All rights reserved.
//

import UIKit



var arrToRandomize1 = [String]()
var arrToRandomize2 = [String]()
var arrToRandomize3 = [String]()

var word1Generated:String = ""
var word2Generated:String = ""
var word3Generated:String = ""



 //Load arrays to randomize
func loadArraysToRandomize (){

    
    switch wordNumber {
        
    case 1:
      
        arrToRandomize3 = []
        arrToRandomize2 = []
        categoryThree = ""
        categoryTwo = ""
        for _ in dataSourceDict {
            arrToRandomize1  = dataSourceDict[categoryOne]!
        }
      
    case 2:
        arrToRandomize3 = []
        categoryThree = ""
        
        for _ in dataSourceDict {
            arrToRandomize1  = dataSourceDict[categoryOne]!
            arrToRandomize2 = dataSourceDict[categoryTwo]!
        }

    
     
    default:
        
        for _ in dataSourceDict {
            arrToRandomize1  = dataSourceDict[categoryOne]!
            arrToRandomize2 = dataSourceDict[categoryTwo]!
            arrToRandomize3 = dataSourceDict[categoryThree]!
        }
     
    }
 
    word1Generated = randomArrayItem(array: arrToRandomize1)!
  
    
    if arrToRandomize2.isEmpty {
       word2Generated = ""
        }
    else{
 
   word2Generated = randomArrayItem(array: arrToRandomize2)!
   
    
    }
    if arrToRandomize3.isEmpty {
         word3Generated = ""
    }
    else{

    word3Generated = randomArrayItem(array: arrToRandomize3)!
       
    }
}
 //Randomizing

func randomArrayItem<T>(array: [T]) -> T? {
    if array.isEmpty { return nil }
    let randomIndex = Int(arc4random_uniform(UInt32(array.count)))

    return array[randomIndex]
}





