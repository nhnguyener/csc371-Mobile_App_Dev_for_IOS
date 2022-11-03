//
//  ConfigViewController.swift
//  MockRemote
//
//  Created by Nathan Nguyen on 2/23/22.
//

import UIKit

class ConfigViewController: UIViewController {
    
    var customData = CustomChannelData()
    var segment = 0
    
    @IBOutlet weak var customLabel: UITextField!
    @IBOutlet weak var customChannel: UILabel!
    @IBOutlet weak var stepperItem: UIStepper!
    @IBOutlet weak var segmentItem: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func customButton(_ sender: UISegmentedControl) {
        segment = sender.selectedSegmentIndex
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        customChannel.text = Int(sender.value).description
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let tempLabel = customLabel.text ?? ""
        if (tempLabel.count < 1 || tempLabel.count > 4) {
            let alertController = UIAlertController(title: "Invalid Label", message: "Please Check Label Length (1-4)", preferredStyle: UIAlertController.Style.alert)
            
            let approveAction = UIAlertAction(title: "Close", style: .default, handler: nil )

            alertController.addAction(approveAction)
            
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if (segment == 0) {
            customData.labelA = tempLabel
            customData.channelA = customChannel.text ?? "0"
        } else if (segment == 1) {
            customData.labelB = tempLabel
            customData.channelB = customChannel.text ?? "0"
        } else if (segment == 2) {
            customData.labelC = tempLabel
            customData.channelC = customChannel.text ?? "0"
        } else if (segment == 3) {
            customData.labelD = tempLabel
            customData.channelD = customChannel.text ?? "0"
        }
        
        let barVC = self.tabBarController?.viewControllers
        let tvVC = barVC![0] as! ViewController
        tvVC.customData = self.customData
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        customLabel.text = ""
        customChannel.text = "1"
        stepperItem.value = 0
        segmentItem.selectedSegmentIndex = 0
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Reset Favorites?", message: "This will reset the favorites bar to default channels", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.setReset() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setReset() {
        customData.reset = true
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        customLabel.resignFirstResponder()
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
