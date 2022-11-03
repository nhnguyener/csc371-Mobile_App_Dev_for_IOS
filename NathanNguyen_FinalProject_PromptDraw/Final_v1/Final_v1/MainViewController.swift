//
//  ViewController.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/18/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainData = WordsData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadButtonClick(_ sender: UIButton) {
        //future to-do: load gallery?
    }
    
    @IBAction func newButtonClick(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = story.instantiateViewController(identifier: "PromptViewController") as! PromptViewController
        
        controller.data = self.mainData
        
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func promptsButtonClick(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = story.instantiateViewController(identifier: "CustomTableViewController") as! CustomTableViewController
        
        controller.data = mainData
        
        controller.completionHandler = { newData in
            self.mainData = newData!
        }
        // show as card
        self.present(controller, animated: true, completion: nil)
         
        
//        let nav = UINavigationController(rootViewController: controller)
//        self.view.addSubview(nav.view)
//        self.addChild(nav)
//        nav.didMove(toParent: self)
    }

}

