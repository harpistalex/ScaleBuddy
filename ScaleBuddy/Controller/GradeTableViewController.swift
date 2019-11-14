//
//  GradeTableViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 30/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

class GradeTableViewController: UITableViewController {

    let userInfo = UserDefaults.standard
    var defaultsGradeNumber : Int = 0
    var selectedGrade : Grade?
    
    let realm = try! Realm()
    var gradeArray : Results<Grade>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGrades()
        
    }
    
    //MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeArray?.count ?? 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradeCell", for: indexPath)
        cell.textLabel?.text = "Grade \(indexPath.row + 1)"
        
        return(cell)
        
    }
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGrade = gradeArray![indexPath.row]
        userInfo.set(indexPath.row + 1, forKey: "SelectedGrade")
        userInfo.set(0, forKey: "ScaleIndex")
        userInfo.set(0, forKey: "ArpeggioIndex")
        
        //TODO: set scalesToUse and arpeggiosToUse to 0?

//        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        performSegue(withIdentifier: "goToKeySignatures", sender: self)
        //TODO: clear arrays in ChooseVC: scalesToUse = [] & arpeggiosToUse = []
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! KeySignaturesTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedGrade = gradeArray?[indexPath.row]
        
        }
        
    }

    
    func loadGrades() {
        gradeArray = realm.objects(Grade.self)
        tableView.reloadData()
        
    }

}
