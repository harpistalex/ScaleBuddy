//
//  Arpeggio.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 29/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import Foundation

class Arpeggio {
    
    let keySignature : Int
    let keyTonality : Int
    let numberOfOctaves : Int
    let handsStyle : Int
    let chordInversion : Int
    let chordType : Int
    
    let practised : Bool = false
    let included : Bool = true
    
    
    init(key: Int, tonality: Int, octaves: Int, style: Int, inversion: Int, type: Int) {
        keySignature = key
        keyTonality = tonality
        numberOfOctaves = octaves
        handsStyle = style
        chordInversion = inversion
        chordType = type
        
    }
    
}
