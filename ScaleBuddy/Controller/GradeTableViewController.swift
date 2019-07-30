//
//  GradeTableViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 30/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit

class GradeTableViewController: UITableViewController {

    let gradeNumbers : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8]
    let userInfo = UserDefaults.standard
    var selectedGrade : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeNumbers.count
    }
        

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "GradeCell", for: indexPath)
         cell.textLabel?.text = "Grade \(gradeNumbers[indexPath.row])"
         return (cell)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGrade = gradeNumbers[indexPath.row]
        userInfo.set(selectedGrade, forKey: "SelectedGrade")
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        //performSegue(withIdentifier: "goToScales", sender: self)
        
        //TODO: remove checkmark if other grade is selected.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: populate Realm database
    }


}
