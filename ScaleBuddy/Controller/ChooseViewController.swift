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

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let defaultsGrade : Int = userInfo.integer(forKey: "SelectedGrade")
        
        print("Defaults grade is \(defaultsGrade)")
        
        
        if defaultsGrade != 0 {
            defaultsGradeNumber = defaultsGrade
    
            chooseScaleButton.isHidden = false
            chooseArpeggioButton.isHidden = false
            scaleOrArpeggio.text = "Choose a scale or arpeggio"
            self.title = "Grade \(defaultsGradeNumber)"
            
            loadScalesAndArpeggios()
            
        } else {
            print("No grade selected")
            chooseScaleButton.isHidden = true
            chooseArpeggioButton.isHidden = true
            scaleOrArpeggio.text = "Please select a grade and choose your scales and arpeggios"
        }
    }


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
    
    func generateChosenScaleLabel(key: Int, tonality: Int, style: Int, octaves: Int, chordType: Int?, inversion: Int?) -> NSMutableAttributedString {
        
        let returnText = NSMutableAttributedString()
        
        let font1 = UIFont(name: "Avenir-Heavy", size: 30)!
        let font2 = UIFont(name: "Avenir", size: 15)!

        
        let keyAttStr = NSMutableAttributedString(string: "\(syllabus.allKeySignatures[key]) ", attributes: [NSAttributedString.Key.font: font1])
        let tonalityAttStr = NSMutableAttributedString(string:"\(syllabus.allTonalities[tonality])\n", attributes: [NSAttributedString.Key.font: font1])
        let styleAttStr = NSMutableAttributedString(string: "\(syllabus.allStyles[style])\n")
        let octavesAttStr = NSMutableAttributedString(string: syllabus.allOctaves[octaves], attributes: [NSAttributedString.Key.font: font2])
        
        if (chordType != nil) && (inversion != nil) {
            
            let chordTypeAttStr = NSMutableAttributedString(string: "\(syllabus.allTypes[chordType!])\n")
            let inversionAttStr = NSMutableAttributedString(string: "\(syllabus.allInversions[inversion!])\n")
            
            returnText.append(keyAttStr)
            returnText.append(tonalityAttStr)
            returnText.append(chordTypeAttStr)
            returnText.append(inversionAttStr)
            returnText.append(styleAttStr)
            returnText.append(octavesAttStr)
            
            
        } else {
            
            returnText.append(keyAttStr)
            returnText.append(tonalityAttStr)
            returnText.append(styleAttStr)
            returnText.append(octavesAttStr)
            
        }
        
        return returnText
        
        //TODO:
        //Check whether scale or arpeggio and create variables for each.
        //Change all parameters to attributed strings.
        //returnString will either be scale or arpeggio variable.
        //Make adding attributes an extension?
        
        ///////////////////////////////////// TEMP:
//        if (chordType != nil) && (inversion != nil) {
//            returnString = "\(syllabus.allKeySignatures[key]) \(syllabus.allTonalities[tonality]) \(syllabus.allTypes[chordType!]) \(syllabus.allStyles[style]) \(syllabus.allInversions[inversion!]) \(syllabus.allOctaves[octaves])"
//        } else {
//            returnString = "\(syllabus.allKeySignatures[key]) \(syllabus.allTonalities[tonality]) \(syllabus.allStyles[style]) \(syllabus.allOctaves[octaves])"
//        }
//        /////////////////////////////////////
//        return returnString
        
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
        
        
        scaleOrArpeggio.attributedText = (generateChosenScaleLabel(key: chosenScale.keySignature, tonality: chosenScale.keyTonality, style: chosenScale.handsStyle, octaves: chosenScale.numberOfOctaves, chordType: nil, inversion: nil))

//        scaleOrArpeggio.text = "\(syllabus.allKeySignatures[chosenScale.keySignature]) \(syllabus.allTonalities[chosenScale.keyTonality] ) \(syllabus.allStyles[chosenScale.handsStyle]) \(syllabus.allOctaves[chosenScale.numberOfOctaves])"
        
        
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
        
        print("generateChosenScaleLabel: \(generateChosenScaleLabel(key: chosenArpeggio.keySignature, tonality: chosenArpeggio.keyTonality, style: chosenArpeggio.handsStyle, octaves: chosenArpeggio.numberOfOctaves, chordType: chosenArpeggio.chordType, inversion: chosenArpeggio.chordInversion))")
        
//        scaleOrArpeggio.text = "\(syllabus.allKeySignatures[chosenArpeggio.keySignature]) \(syllabus.allTonalities[chosenArpeggio.keyTonality]) \(syllabus.allTypes[chosenArpeggio.chordType]) \(syllabus.allStyles[chosenArpeggio.handsStyle]) \(syllabus.allInversions[chosenArpeggio.chordInversion]) \(syllabus.allOctaves[chosenArpeggio.numberOfOctaves])"
        
        scaleOrArpeggio.attributedText = generateChosenScaleLabel(key: chosenArpeggio.keySignature, tonality: chosenArpeggio.keyTonality, style: chosenArpeggio.handsStyle, octaves: chosenArpeggio.numberOfOctaves, chordType: chosenArpeggio.chordType, inversion: chosenArpeggio.chordInversion)
        
        if index >= grade.arpeggiosToUse.count - 1 {
            index = 0
        } else {
            index += 1
        }
        
        userInfo.set(index, forKey: "ArpeggioIndex")

        
    }
    
    /////////////////////////////////
    @IBAction func testButtonPressed(_ sender: Any) {
        
        let number = Int.random(in: 0..<9)
        let text = syllabus.allStyles[number]
        let font = UIFont(name: "Avenir-Heavy", size: 24)
        let attText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: font!])
        
        scaleOrArpeggio.attributedText = attText
        
    }
    /////////////////////////////////

}


