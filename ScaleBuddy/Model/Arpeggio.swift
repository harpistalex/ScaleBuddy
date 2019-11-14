//
//  Arpeggio.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 29/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import Foundation
import RealmSwift

class Arpeggio: Object {
    
    @objc dynamic var keySignature : Int = 0
    @objc dynamic var keyTonality : Int = 0
    @objc dynamic var numberOfOctaves : Int = 0
    @objc dynamic var handsStyle : Int = 0
    @objc dynamic var chordInversion : Int = 0
    @objc dynamic var chordType : Int = 0
    
    @objc dynamic var practised : Bool = false //remove this
    @objc dynamic var included : Bool = true
    
    
    convenience init(key: Int, tonality: Int, octaves: Int, style: Int, inversion: Int, type: Int) {
        self.init()
        self.keySignature = key
        self.keyTonality = tonality
        self.numberOfOctaves = octaves
        self.handsStyle = style
        self.chordInversion = inversion
        self.chordType = type
        
    }

}
