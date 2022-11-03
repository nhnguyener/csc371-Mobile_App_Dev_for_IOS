//
//  ViewController.swift
//  ShoppingList
//
//  Created by Nathan Nguyen on 2/8/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfDescription: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var currentList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonNewList(_ sender: UIButton) {
        let alertController = UIAlertController(title: "New List", message: "Clear old shopping list?", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.clearList() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func buttonNewItem(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "New Item", message: "Clear old item description & quantity?", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.clearTF() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        
        if (tfDescription.text == "" || tfQuantity.text == "") {
            let alertController = UIAlertController(title: "Error: Add Item", message: "Description and/or quantity empty.", preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let quantity = tfQuantity.text ?? ""
        
        if (Int(quantity) == nil) {
            let alertController = UIAlertController(title: "Error: Add Item", message: "Quantity is not a numerical value.", preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        var tempList = currentList.text ?? ""
        tempList += "\n\(tfQuantity.text ?? "")x \(tfDescription.text ?? "")"
        
        currentList.text = tempList
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func clearTF() {
        tfDescription.text = ""
        tfQuantity.text = ""
    }
    
    func clearList() {
        currentList.text = "Current List:"
    }
}

