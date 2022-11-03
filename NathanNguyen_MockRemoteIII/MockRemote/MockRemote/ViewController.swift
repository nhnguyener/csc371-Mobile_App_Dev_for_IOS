//
//  ViewController.swift
//  MockRemote
//
//  Created by Nathan Nguyen on 2/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var customData = CustomChannelData()

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var segmentLabels: UISegmentedControl!
    
    @IBOutlet weak var volumeItem: UISlider!
    @IBOutlet var buttonItems: [UIButton]!
    @IBOutlet weak var segmentItem: UISegmentedControl!
    
    var segChannelA = 7
    var segChannelB = 42
    var segChannelC = 21
    var segChannelD = 69
    
    var currentChannel = -1
    var tempChannel = ""
    var checkPower = false
    var buttonPresses = 0
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerLabel.text = sender.isOn ? "On" : "Off"
        checkPower = sender.isOn ? true : false
        
        if (sender.isOn == false) {
            volumeItem.isEnabled = false
            segmentItem.isEnabled = false
            for b in buttonItems {
                b.isEnabled = false
            }
        } else if (sender.isOn == true) {
            volumeItem.isEnabled = true
            segmentItem.isEnabled = true
            for b in buttonItems {
                b.isEnabled = true
            }
        }
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        if (!checkPower) {
            return
        }
        
        volumeLabel.text = "\(Int(sender.value * 100))"
    }
    
    @IBAction func channelButton(_ sender: UIButton) {
        if (!checkPower) {
            return
        }
        
        if (sender.tag == 10) {
            if (currentChannel < 99) {
                currentChannel += 1
                channelLabel.text = "\(currentChannel)"
            }
        } else if (sender.tag == 11) {
            if (currentChannel > 1) {
                currentChannel -= 1
                channelLabel.text = "\(currentChannel)"
            }
        } else {
            if (buttonPresses < 2) {
                tempChannel = "\(tempChannel)\(sender.tag)"
                buttonPresses += 1
            }
            if (buttonPresses == 2) {
                currentChannel = Int(tempChannel) ?? 0
                
                if (currentChannel != 0) {
                    channelLabel.text = "\(currentChannel)"
                }
                tempChannel = ""
                buttonPresses = 0
            }
        }
    }
    
    @IBAction func channelFavoriteSegment(_ sender: UISegmentedControl) {
        if (!checkPower) {
            return
        }
        switch sender.selectedSegmentIndex {
            case 0:
                currentChannel = segChannelA
            case 1:
                currentChannel = segChannelB
            case 2:
                currentChannel = segChannelC
            case 3:
                currentChannel = segChannelD
            default:
                break
        }
        
        channelLabel.text = "\(currentChannel)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (customData.reset == true) {
            resetSegment()
            customData.reset = false
            let barVC = self.tabBarController?.viewControllers
            let configVC = barVC![2] as! ConfigViewController
            configVC.customData = self.customData
            return
        }
        
        segmentLabels.setTitle(customData.labelA, forSegmentAt: 0)
        segmentLabels.setTitle(customData.labelB, forSegmentAt: 1)
        segmentLabels.setTitle(customData.labelC, forSegmentAt: 2)
        segmentLabels.setTitle(customData.labelD, forSegmentAt: 3)
        segChannelA = Int(customData.channelA) ?? 0
        segChannelB = Int(customData.channelB) ?? 0
        segChannelC = Int(customData.channelC) ?? 0
        segChannelD = Int(customData.channelD) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func resetSegment() {
        segmentItem.setTitle("ABC", forSegmentAt: 0)
        segChannelA = 7
        segmentItem.setTitle("NBC", forSegmentAt: 1)
        segChannelA = 42
        segmentItem.setTitle("CBS", forSegmentAt: 2)
        segChannelA = 21
        segmentItem.setTitle("FOX", forSegmentAt: 3)
        segChannelA = 69
    }
}
