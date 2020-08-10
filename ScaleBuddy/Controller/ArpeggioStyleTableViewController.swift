//
//  ArpeggioStyleTableViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 03/10/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

class ArpeggioStyleTableViewController: UITableViewController {
    
    var arpeggiosToUse : List<Arpeggio>?
    
    var hands : Array<Int> = []
    var arpeggioTypes : Array<Int> = []
    var arpeggioInversions : Array<Int> = []
    
    var titleString = [0 : "Hands", 1 : "Type", 2: "Inversion"]
    var rowString : [Int: Array<Int>] = [0: [], 1: [], 2: []]
    
    let syllabus = Syllabus()
    let realm = try! Realm()
    
    var selectedGrade : Grade? {
        didSet {
            arpeggiosToUse = selectedGrade?.arpeggioList
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHandsAndStyles()
        
        rowString = [0: hands, 1: arpeggioTypes, 2: arpeggioInversions]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if arpeggioTypes == [] {
            return 1
        } else if arpeggioInversions == [] {
            return 2
        } else {
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowString[section]?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StyleCell", for: indexPath)
        
        //TODO: Doesn't work at g.1-3 or g.6-7.

        if let style = rowString[indexPath.section] {
            switch indexPath.section {
            case 0 : cell.textLabel?.text = "\(syllabus.allStyles[style[indexPath.row]].capitalizingFirstLetter())"
            case 1 : cell.textLabel?.text = "\(syllabus.allTypes[style[indexPath.row]].capitalizingFirstLetter())"
            case 2 : cell.textLabel?.text = "\(syllabus.allInversions[style[indexPath.row]].capitalizingFirstLetter())"
            default : cell.textLabel?.text = "No arpeggios available"
            }
        } else {
            cell.textLabel?.text = "No arpeggios available"
        }
        
        let selectedStyle = returnStyleInt(style: indexPath.row, arrayToUse: indexPath.section)
        //print("selectedStyle = \(selectedStyle)")
        
        if let arpeggios = arpeggiosToUse {
            switch indexPath.section {
            case 0 : if let index = arpeggios.firstIndex(where: { $0.handsStyle == selectedStyle  }) {
                //print("The first index = \(index)")
                cell.accessoryType = arpeggios[index].included == true ? .checkmark : .none
                }
            case 1 : if let index = arpeggios.firstIndex(where: { $0.chordType == selectedStyle  }) {
                //print("The first index = \(index)")
                cell.accessoryType = arpeggios[index].included == true ? .checkmark : .none
                }
            case 2: if let index = arpeggios.firstIndex(where: { $0.chordInversion == selectedStyle  }) {
                //print("The first index = \(index)")
                cell.accessoryType = arpeggios[index].included == true ? .checkmark : .none
                }
            default: break
            }
            
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var arpeggioStyle = ""

        switch indexPath.section {
        case 0 : arpeggioStyle = "handsStyle"
        case 1 : arpeggioStyle = "chordType"
        case 2 : arpeggioStyle = "chordInversion"
        default : print("No arpeggios available...")
        }
        
        if let arpeggios = arpeggiosToUse?.filter("\(arpeggioStyle) = \(returnStyleInt(style: indexPath.row, arrayToUse: indexPath.section))") {
            
            for i in 0..<(arpeggios.count) {
                do {
                    try realm.write {
                        arpeggios[i].included = !arpeggios[i].included
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadHandsAndStyles() {
        
        var numberOfArpeggios = 0
        
        if let arpeggios = arpeggiosToUse {
            
            numberOfArpeggios = arpeggios.count
            
            for i in 0..<numberOfArpeggios {
                switch arpeggios[i].handsStyle {
                    case 0 : hands.append(arpeggios[i].handsStyle)
                    case 1 : hands.append(arpeggios[i].handsStyle)
                    case 2 : hands.append(arpeggios[i].handsStyle)
                    case 8 : hands.append(arpeggios[i].handsStyle)
                    case 9 : hands.append(arpeggios[i].handsStyle)
                    default: break
                }
            }
            
            for i in 0..<numberOfArpeggios {
                switch arpeggios[i].chordType {
                case 1 : arpeggioTypes.append(arpeggios[i].chordType)
                case 2 : arpeggioTypes.append(arpeggios[i].chordType)
                default: break
                }
            }
                
            for i in 0..<numberOfArpeggios {
                switch arpeggios[i].chordInversion {
                case 1 : arpeggioInversions.append(arpeggios[i].chordInversion)
                case 2 : arpeggioInversions.append(arpeggios[i].chordInversion)
                case 3 : arpeggioInversions.append(arpeggios[i].chordInversion)
                default: break
                }
            }
        }
        
        hands.removeDuplicates()
        arpeggioTypes.removeDuplicates()
        arpeggioInversions.removeDuplicates()
        print("hands = \(hands)")
        print("arpeggioTypes = \(arpeggioTypes)")
        print("arpeggioInversions = \(arpeggioInversions)")
    }
    
    func returnStyleInt(style: Int, arrayToUse: Int) -> Int {
        
        var arpeggioStyle = 0
        
        if arrayToUse == 0 {
            arpeggioStyle = hands[style]
        } else if arrayToUse == 1 {
            arpeggioStyle = arpeggioTypes[style]
        } else {
            arpeggioStyle = arpeggioInversions[style]
        }
        
        return arpeggioStyle
        
    }

    @IBAction func donePressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
