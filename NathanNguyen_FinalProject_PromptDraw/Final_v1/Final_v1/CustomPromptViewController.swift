//
//  CustomPromptViewController.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/19/22.
//

import UIKit

class CustomPromptViewController: UIViewController {
    
    var wordsData = WordsData()
    
    var newData: WordsData? = nil
    var titleText: String? = nil
    var wordText: String? = nil

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titleLabel.text = titleText
        self.wordLabel.text = wordText
        self.wordsData = newData!
    }
    
    @IBAction func addButtonClick(_ sender: UIButton) {
        let tempLabel = wordTextField.text ?? ""
        if (tempLabel.count < 1) {
            let alertController = UIAlertController(title: "No Word to Add", message: "Please enter a word.", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        } else if (tempLabel.contains(" ")) {
            let alertController = UIAlertController(title: "Invalid Word", message: "Only one word can be entered at a time (no spaces).", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        }

        wordLabel.text = "\(wordLabel.text ?? "error")\n\(wordTextField.text ?? "")"    }
    
    @IBAction func removeButtonClick(_ sender: UIButton) {
        let tempLabel = wordTextField.text ?? ""
        if (tempLabel.count < 1) {
            let alertController = UIAlertController(title: "No Word to Add", message: "Please enter a word.", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        } else if (tempLabel.contains(" ")) {
            let alertController = UIAlertController(title: "Invalid Word", message: "Only one word can be entered at a time (no spaces).", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let temp = wordLabel.text ?? ""
        if (temp.contains(tempLabel)) {
            let alertController = UIAlertController(title: "Remove Word?", message: "The following word will be removed: \(tempLabel)", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.removeWord(word: tempLabel) })
            let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            
            alertController.addAction(approveAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Word Not Found", message: "Inputted word is not found in list.", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func removeWord(word: String) {
        var temp = wordLabel.text ?? ""
        let removed = temp.replacingOccurrences(of: word, with: "")
        wordLabel.text = removed
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Save New Words?", message: "All edits will be saved.", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.saveData() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public var completionHandler: ((WordsData?) -> Void)?
    
    func saveData() {
        if (titleText == "nouns") {
            wordsData.words[0] = wordLabel.text ?? "error"
        } else if (titleText == "adjectives") {
            wordsData.words[1] = wordLabel.text ?? "error"
        }
        
        completionHandler?(self.wordsData)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
