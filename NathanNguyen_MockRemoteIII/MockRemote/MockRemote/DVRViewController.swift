//
//  DVRViewController.swift
//  MockRemote
//
//  Created by Nathan Nguyen on 2/15/22.
//

import UIKit

class DVRViewController: UIViewController {

    @IBOutlet weak var DVRPowerLabel: UILabel!
    @IBOutlet weak var DVRStateLabel: UILabel!
    
    var checkPower = false
    var currentState = 2
    var forcedState = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func DVRPowerSwitch(_ sender: UISwitch) {
        DVRPowerLabel.text = sender.isOn ? "On" : "Off"
        checkPower = sender.isOn ? true : false
    }
    
    @IBAction func DVRButton(_ sender: UIButton) {
        if (checkPower == false) {
            return
        }
        
        if (sender.tag == 1) {
            if (currentState == 6) {
                forcedState = "Playing"
                createAlert(title: "Force Operation: Play?", body: "The requested operation is not possible. Force anyways?")
                return
            }
            DVRStateLabel.text = "Playing"
            currentState = 1
        } else if (sender.tag == 2) {
            DVRStateLabel.text = "Stopped"
            currentState = 2
        } else if (sender.tag == 3) {
            if (currentState != 1) {
                forcedState = "Paused"
                createAlert(title: "Force Operation: Pause?", body: "The requested operation is not possible. Force anyways?")
                return
            }
            DVRStateLabel.text = "Paused"
            currentState = 3
        } else if (sender.tag == 4) {
            if (currentState != 1) {
                forcedState = "Fast forwarding"
                createAlert(title: "Force Operation: Fast Forward?", body: "The requested operation is not possible. Force anyways?")
                return
            }
            DVRStateLabel.text = "Fast forwarding"
            currentState = 4
        } else if (sender.tag == 5) {
            if (currentState != 1) {
                forcedState = "Fast rewinding"
                createAlert(title: "Force Operation: Fast Rewind?", body: "The requested operation is not possible. Force anyways?")
                return
            }
            DVRStateLabel.text = "Fast rewinding"
            currentState = 5
        } else if (sender.tag == 6) {
            if (currentState != 2) {
                forcedState = "Recording"
                createAlert(title: "Force Operation: Record?", body: "The requested operation is not possible. Force anyways?")
                return
            }
            DVRStateLabel.text = "Recording"
            currentState = 6
        }
    }
    
    func createAlert(title: String, body: String) {
        let alertController = UIAlertController(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.confirmAlert() })

        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func confirmAlert() {
        let alertController = UIAlertController(title: "Forced Operation", message: "The current operation has been stopped. Proceeding with new one.", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(approveAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        DVRStateLabel.text = forcedState
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
