//
//  CustomTableViewController.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/20/22.
//

import UIKit

class CustomTableViewController: UITableViewController {

    var data = WordsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
     */

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_MASTER", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = data.title[indexPath.row]

        return cell
    }

    public var completionHandler: ((WordsData?) -> Void)?
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Save New Words?", message: "All edits will be saved.", preferredStyle: UIAlertController.Style.alert)
        
        let approveAction = UIAlertAction(title: "Yes", style: .default, handler: { action in self.saveData() })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alertController.addAction(approveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func saveData() {
        completionHandler?(self.data)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let indexPath = tableView.indexPathForSelectedRow {
            (segue.destination as? CustomPromptViewController)?.titleText = data.title[indexPath.row]
            (segue.destination as? CustomPromptViewController)?.wordText = data.words[indexPath.row]
            (segue.destination as? CustomPromptViewController)?.newData = data
        }
        
        let segVC = segue.destination as? CustomPromptViewController
        segVC?.completionHandler = { newData in
            self.data = newData!
        }
        
    }

}
