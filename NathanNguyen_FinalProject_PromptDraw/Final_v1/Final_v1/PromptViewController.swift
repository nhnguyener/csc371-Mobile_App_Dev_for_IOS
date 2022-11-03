//
//  PromptViewController.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/18/22.
//

import UIKit

class PromptViewController: UIViewController {

    var data = WordsData()
    
    @IBOutlet weak var nounLabel: UILabel!
    @IBOutlet weak var adjLabel: UILabel!
    
    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0) {
            canvasView.changeColor(x: 0)
        } else if (sender.selectedSegmentIndex == 1) {
            canvasView.changeColor(x: 1)
        } else if (sender.selectedSegmentIndex == 2) {
            canvasView.changeColor(x: 2)
        }
    }
    
    @IBAction func randomButtonClick(_ sender: UIButton) {
        let nounArray = toArray(words: data.words[0])
        let adjArray = toArray(words: data.words[1])
        
        let randNoun = Int.random(in: 0..<nounArray.count)
        let randAdj = Int.random(in: 0..<adjArray.count)
        
        nounLabel.text = nounArray[randNoun]
        adjLabel.text = adjArray[randAdj]
    }
    
    func toArray(words: String) -> [String] {
        
        var stringArray = [String]()
        stringArray = words.components(separatedBy: "\n")

        return stringArray
    }
    
    @IBAction func saveDrawing(_ sender: UIButton) {
        //to-do screenshot?
    }
    
    @IBAction func exitButtonClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Exit Drawing?", message: "Please save before exiting.", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.exitDrawing() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func exitDrawing() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearButtonClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Clear Drawing?", message: "Drawing will be cleared.", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.canvasView.clearCanvas() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
