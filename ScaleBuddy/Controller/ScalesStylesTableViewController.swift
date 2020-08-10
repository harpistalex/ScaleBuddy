//
//  StylesAndInversionsTableViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 26/09/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

class ScalesStylesTableViewController: UITableViewController {
    
    var scalesToUse : List<Scale>?

    var hands : Array<Int> = []
    var scaleStyles : Array<Int> = []
    
    var titleString = [0 : "Hands", 1 : "Style"]
    var rowString : [Int: Array<Int>] = [0: [], 1: []]
    
    let syllabus = Syllabus()
    let realm = try! Realm()
    
    var selectedGrade : Grade? {
        didSet {
            scalesToUse = selectedGrade?.scaleList
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHandsAndStyles()
        
        rowString = [0: hands, 1: scaleStyles]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        if scaleStyles == [] {
            return 1
        } else {
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowString[section]?.count ?? 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StyleCell", for: indexPath)

        if let style = rowString[indexPath.section] {
            cell.textLabel?.text = "\(syllabus.allStyles[style[indexPath.row]].capitalizingFirstLetter())"
        } else {
            cell.textLabel?.text = "No scales available"
        }
        
        let selectedStyle = returnHandsStyleInt(style: indexPath.row, arrayToUse: indexPath.section)
        //print("selectedStyle = \(selectedStyle)")
        
        
        if let scales = scalesToUse {
            if let index = scales.firstIndex(where: { $0.handsStyle == selectedStyle  }) {
                //print("The first index = \(index)")
                cell.accessoryType = scales[index].included == true ? .checkmark : .none
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let scales = scalesToUse?.filter("handsStyle = \(returnHandsStyleInt(style: indexPath.row, arrayToUse: indexPath.section))") {
            
            for i in 0..<(scales.count) {
                do {
                    try realm.write {
                        scales[i].included = !scales[i].included
                    }
                } catch {
                    print("Error saving included status, \(error)")
                }
                
            }
            
        }
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        sectionView.backgroundColor = UIColor.gray
        
        let sectionName = UILabel(frame: CGRect(x: 5, y: 0, width: tableView.frame.size.width, height: 25))
        sectionName.text = titleString[section]
        sectionName.textColor = UIColor.white
        sectionName.font = UIFont.systemFont(ofSize: 14)
        sectionName.textAlignment = .left
        
        sectionView.addSubview(sectionName)
        return sectionView
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ArpeggioStyleTableViewController
        
        destinationVC.selectedGrade = selectedGrade
        
    }
    
    func loadHandsAndStyles() {
        
        var numberOfScales = 0
        
        if let scales = scalesToUse {
            
            numberOfScales = scales.count
            
            for i in 0..<numberOfScales {
                switch scales[i].handsStyle {
                case 0 : hands.append(scales[i].handsStyle)
                case 1 : hands.append(scales[i].handsStyle)
                case 2 : hands.append(scales[i].handsStyle)
                case 3 : scaleStyles.append(scales[i].handsStyle)
                case 4 : scaleStyles.append(scales[i].handsStyle)
                case 5 : scaleStyles.append(scales[i].handsStyle)
                case 6 : scaleStyles.append(scales[i].handsStyle)
                case 7 : scaleStyles.append(scales[i].handsStyle)
                default: return
                }
            }
            
        }
        
        hands.removeDuplicates()
        scaleStyles.removeDuplicates()
        print("hands = \(hands)")
        print("scaleStyles = \(scaleStyles)")
        
    }
    
    func returnHandsStyleInt(style: Int, arrayToUse: Int) -> Int {
        
        var handsStyle = 0
        
        if arrayToUse == 0 {
            handsStyle = hands[style]
        } else {
            handsStyle = scaleStyles[style]
        }
        
        return handsStyle
        
    }

}

extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

