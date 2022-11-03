//
//  ViewController.swift
//  Calculator
//
//  Created by Nathan Nguyen on 1/25/22.
//

import UIKit

class ViewController: UIViewController {

    var currNumber = 0
    var holdNumber = 0
    var resultNumber = 0
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func clear() {
        
        currNumber = 0
        holdNumber = 0
        resultNumber = 0
    }
    
    @IBAction func buttonPressed(_ sender: UIButton, forEvent event: UIEvent) {
        
        if (sender.tag == 10) { //10 is '+'
            
            holdNumber = currNumber
            currNumber = 0
            labelResult.text = "+"
            
        } else if (sender.tag == 98) { //98 is '='
            
            resultNumber = holdNumber + currNumber
            
            currNumber = resultNumber
            holdNumber = 0
            
            labelResult.text = "\(resultNumber)"
            
        } else if (sender.tag == 99) { //99 is clear
            
            clear()
            
        } else {
        
            let temp = Int("\(currNumber)\(sender.tag)" ) ?? 0
            
            currNumber = temp
            
            labelResult.text = "\(currNumber)"
            
        }
        
    }

}

