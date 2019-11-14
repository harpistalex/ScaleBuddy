//
//  ViewController.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 04/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import UIKit
import RealmSwift

class ChooseViewController: UIViewController {
    
    @IBOutlet weak var scaleOrArpeggio: UILabel!
    @IBOutlet weak var chooseScaleButton: UIButton!
    @IBOutlet weak var chooseArpeggioButton: UIButton!
    
    let userInfo = UserDefaults.standard
    var defaultsGradeNumber : Int = 0
    
    var grade = Grade()

    let syllabus = Syllabus()
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseScaleButton.layer.borderWidth = 1
        chooseScaleButton.layer.borderColor = UIColor.black.cgColor
        
        chooseArpeggioButton.layer.borderWidth = 1
        chooseArpeggioButton.layer.borderColor = UIColor.black.cgColor
        
        let insets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        scaleOrArpeggio.layoutMargins = insets

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaultsGrade : Int = userInfo.integer(forKey: "SelectedGrade")
        
        print("Defaults grade is \(defaultsGrade)")
        
        
        if defaultsGrade != 0 {
            defaultsGradeNumber = defaultsGrade
            
            //TODO: Hide buttons in prepare for segue in other VCs? Or make them so they don't actually do anything and don't hide at all...
            chooseScaleButton.isHidden = false
            chooseArpeggioButton.isHidden = false
            scaleOrArpeggio.text = "Choose a scale or arpeggio"
            
            loadScalesAndArpeggios()
            
        } else {
            print("No grade selected")
            chooseScaleButton.isHidden = true
            chooseArpeggioButton.isHidden = true
            scaleOrArpeggio.text = "Please select a grade and choose your scales and arpeggios"
        }
    }
    
    //TODO: check about scalesToUse and arpeggiosToUse appending scales over and over.
    //TODO: Perhaps put this in KeySignatures TVC? Perhaps shuffle it at the start?

    func loadScalesAndArpeggios() {

        grade = realm.objects(Grade.self)[defaultsGradeNumber - 1]
        
        let scales = grade.scaleList
        print("loadScalesAndArpeggios Scales: \(scales.count)")
        let arpeggios = grade.arpeggioList
        print("loadScalesAndArpeggios Apeggios: \(arpeggios.count)")
        
        do {
            let realm = try Realm()
            try realm.write {
                grade.scalesToUse.removeAll()
                grade.arpeggiosToUse.removeAll()
            }
        } catch {
            print("Error writing to Realm, \(error)")
        }

        
        //Mark: check which scales are included.
        
        for i in 0..<(scales.count) {

            if scales[i].included == true {
                
                do {
                    let realm = try Realm()
                    try realm.write {
                        grade.scalesToUse.append(i)
                    }
                } catch {
                    print("Error writing to Realm, \(error)")
                }
            
            }

        }
        
        //Mark: check which arpeggios are included.

        for i in 0..<(arpeggios.count) {
            if arpeggios[i].included == true {
                do {
                    let realm = try Realm()
                    try realm.write {
                        grade.arpeggiosToUse.append(i)
                    }
                } catch {
                    print("Error writing to Realm, \(error)")
                }
            }

        }

    }
    
    
    @IBAction func chooseScalePressed() {
        
        var index = userInfo.integer(forKey: "ScaleIndex")
        print("ScaleIndex = \(index)")
        
        if index == 0 {
            
            do {
                try realm.write {
                    grade.scalesToUse.shuffle()
                }
            } catch {
                print("Error initialising new Realm, \(error)")
                }
        } else {
            print("nothing")
        }
    
        let chosenScale = grade.scaleList[grade.scalesToUse[index]]

        scaleOrArpeggio.text = "\(syllabus.allKeySignatures[chosenScale.keySignature]) \(syllabus.allTonalities[chosenScale.keyTonality]) \(syllabus.allStyles[chosenScale.handsStyle]) \(syllabus.allOctaves[chosenScale.numberOfOctaves])"
        
        if index >= grade.scalesToUse.count - 1 {
            index = 0
        } else {
            index += 1
        }

        userInfo.set(index, forKey: "ScaleIndex")

    }

    @IBAction func chooseArpeggioPressed() {
        
        var index = userInfo.integer(forKey: "ArpeggioIndex")
        print("ArpeggioIndex = \(index)")
        
        if index == 0 {
            
            do {
                try realm.write {
                    grade.arpeggiosToUse.shuffle()
                }
            } catch {
                print("Error initialising new Realm, \(error)")
            }
        } else {
            print("nothing")
        }
        let chosenArpeggio = grade.arpeggioList[grade.arpeggiosToUse[index]]
        
        scaleOrArpeggio.text = "\(syllabus.allKeySignatures[chosenArpeggio.keySignature]) \(syllabus.allTonalities[chosenArpeggio.keyTonality]) \(syllabus.allTypes[chosenArpeggio.chordType]) \(syllabus.allStyles[chosenArpeggio.handsStyle]) \(syllabus.allInversions[chosenArpeggio.chordInversion]) \(syllabus.allOctaves[chosenArpeggio.numberOfOctaves])"
        
        if index >= grade.arpeggiosToUse.count - 1 {
            index = 0
        } else {
            index += 1
        }
        
        userInfo.set(index, forKey: "ArpeggioIndex")

        
    }


}

