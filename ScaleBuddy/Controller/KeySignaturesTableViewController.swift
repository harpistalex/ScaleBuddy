//
//  ScalesTableViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 30/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

class KeySignaturesTableViewController: UITableViewController {

    var scalesToUse : List<Scale>?
    var arpeggiosToUse : List<Arpeggio>?
    var majorKeySignatures : Array<Int> = []
    var harmonicMinorKeySignatures : Array<Int> = []
    var melodicMinorKeySignatures : Array<Int> = []
    var diminishedArpeggios : Array<Int> = []
    
    var titleString = [0 : "Major", 1 : "Harmonic Minor", 2: "Melodic Minor", 3: "Diminished Arpeggio"]
    var rowString : [Int: Array<Int>] = [0: [], 1: [], 2: [], 3: []]

    
    let syllabus = Syllabus()
    let realm = try! Realm()
    
    var selectedGrade : Grade? {
        didSet {
            loadScalesAndArpeggios()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMajorKeySignatures()
        loadHarmonicMinorKeySignatures()
        loadMelodicMinorKeySignatures()
        loadDiminishedArpeggios()
        
        rowString = [0: majorKeySignatures, 1: harmonicMinorKeySignatures, 2: melodicMinorKeySignatures, 3: diminishedArpeggios]
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if harmonicMinorKeySignatures == [] {
            return 1
        } else if melodicMinorKeySignatures == [] {
            return 2
        } else if diminishedArpeggios == [] {
            return 3
        } else {
            return 4
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowString[section]?.count ?? 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scaleCell", for: indexPath)

        
        if let tonality = titleString[indexPath.section] {
            if let key = rowString[indexPath.section] {
                cell.textLabel?.text = "\(syllabus.allKeySignatures[key[indexPath.row]]) \(tonality.lowercased())"
            } else {
                cell.textLabel?.text = "No scales available"
            }
        }
        
        if let scales = scalesToUse {
            if let arpeggios = arpeggiosToUse {
                if indexPath.section == 0 {
                    cell.accessoryType = scales[indexPath.row].included == true ? .checkmark : .none
                } else if indexPath.section == 1 {
                    cell.accessoryType = scales[(indexPath.row)+(majorKeySignatures.count)].included == true ? .checkmark : .none
                } else if indexPath.section == 2 {
                    cell.accessoryType = scales[(indexPath.row) + (majorKeySignatures.count) + (harmonicMinorKeySignatures.count)].included == true ? .checkmark : .none
                } else {
                    cell.accessoryType = arpeggios[((arpeggios.count) - 3) + (indexPath.row)].included == true ? .checkmark : .none
                }
            } else {
                print("No arpeggios found")
            }
        } else {
            print("No scales found")
        }

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(indexPath.row)
        print(indexPath.section)
        
        searchRealmDatabase(key: indexPath.row, tonality: indexPath.section)
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
        
        let destinationVC = segue.destination as! ScalesStylesTableViewController
        
        destinationVC.selectedGrade = selectedGrade
        
    }
    
    
    func loadScalesAndArpeggios() {
        
        scalesToUse = selectedGrade?.scaleList
        arpeggiosToUse = selectedGrade?.arpeggioList
        
    }
    
    func loadMajorKeySignatures() {
        
        var numberOfScales = 0
        
        if let scales = scalesToUse {
            
            numberOfScales = scales.count
            
            for i in 0..<numberOfScales {
                if scales[i].keyTonality == 0 && scales[i].handsStyle == 0 {
                    majorKeySignatures.append(scales[i].keySignature)
                }
            }
            
        }
    
    }
    
    func loadHarmonicMinorKeySignatures() {
        
        var numberOfScales = 0
        
        if let scales = scalesToUse {
            
            numberOfScales = scales.count
            
            for i in 0..<numberOfScales {
                if scales[i].keyTonality == 1 && scales[i].handsStyle == 0 {
                    harmonicMinorKeySignatures.append(scales[i].keySignature)
                }
            }
            
        }
        
    }
    
    func loadMelodicMinorKeySignatures() {
        
        var numberOfScales = 0
        
        if let scales = scalesToUse {
            
            numberOfScales = scales.count
            
            for i in 0..<numberOfScales {
                if scales[i].keyTonality == 2 && scales[i].handsStyle == 0 {
                    melodicMinorKeySignatures.append(scales[i].keySignature)
                }
            }
            
        }

    }
    
    func loadDiminishedArpeggios() {
        
        var numberOfArpeggios = 0
        
        if let arpeggios = arpeggiosToUse {
            
            numberOfArpeggios = arpeggios.count
            
            for i in 0..<numberOfArpeggios {
                if arpeggios[i].keyTonality == 3 && arpeggios[i].handsStyle == 0 {
                    diminishedArpeggios.append(arpeggios[i].keySignature)
                }
            }
            
        }

    }
    
    func searchRealmDatabase(key: Int, tonality: Int) {
        
        var keyLetter = 0
        
        if tonality == 0 {
            keyLetter = majorKeySignatures[key]
        } else if tonality == 1 {
            keyLetter = harmonicMinorKeySignatures[key]
        } else if tonality == 2 {
            keyLetter = melodicMinorKeySignatures[key]
        } else {
            keyLetter = diminishedArpeggios[key]
        }
        
        if let allGradeScales = scalesToUse {
            
            for i in 0..<(allGradeScales.count) {
                if allGradeScales[i].keyTonality == tonality && allGradeScales[i].keySignature == keyLetter {
                    
                    print("selected key signature = \(allGradeScales[i].keySignature) \(allGradeScales[i].keyTonality)")
                    
                    do {
                        try realm.write {
                            allGradeScales[i].included = !allGradeScales[i].included
                        }
                    } catch {
                        print("Error saving included status, \(error)")
                    }
                    
                }
                
            }
            
        }
        
        if let allGradeArpeggios = arpeggiosToUse {
            
            for i in 0..<(allGradeArpeggios.count) {
                if allGradeArpeggios[i].keyTonality == tonality && allGradeArpeggios[i].keySignature == keyLetter {
                    
                    print("selected key signature = \(allGradeArpeggios[i].keySignature) \(allGradeArpeggios[i].keyTonality)")
                    
                    do {
                        try realm.write {
                            allGradeArpeggios[i].included = !allGradeArpeggios[i].included
                        }
                    } catch {
                        print("Error saving included status, \(error)")
                    }
                    
                }
                
            }
            
        }

    }

}
