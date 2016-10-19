//
//  ModelViewController.swift
//  CodeName
//
//  Created by Maree Williams on 1/10/2016.
//  Copyright © 2016 Maree Williams. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {
    @IBOutlet weak var viewer: UIImageView!

    @IBOutlet weak var codeNameLabel: UILabel!
   var circleCenter: CGPoint!
   var circleAnimator: UIViewPropertyAnimator!

    
    override func viewDidLoad() {
        super.viewDidLoad()
         loadArraysToRandomize()
       codeNameLabel.text = word1Generated + " " + word2Generated + " " + word3Generated
  
        /*
       
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         codeNameLabel.center.x  -= view.bounds.width
         UIView.animate(withDuration: 0.5, animations: {
        
        
         let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        
       
         let animationDuration = 10.0
    
         circle.center = self.view.center
         circle.layer.cornerRadius = 50.0
         circle.backgroundColor = UIColor.purple
       
        self.circleAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut, animations: {
            [unowned circle] in
            // 3x scale
            circle.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
      
            })
        
        self.view.addSubview(circle)

        })
       
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.codeNameLabel.center.x += self.view.bounds.width
            }, completion: nil)
       



    }
     
 
 
}
