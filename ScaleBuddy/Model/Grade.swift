//
//  Grade.swift
//  ScaleBuddy
//
//  Created by Alexandra King on 29/07/2019.
//  Copyright © 2019 Alex's Amazing Apps. All rights reserved.
//

import Foundation
import RealmSwift

class Grade: Object {
    
    let scaleList = List<Scale>()
    let arpeggioList = List<Arpeggio>()
    var scalesToUse = List<Int>()
    var arpeggiosToUse = List<Int>()
    
    func addScale(key: Int, tonality: Int, octaves: Int, style: Int ) {
        let scale = Scale(key: key, tonality: tonality, octaves: octaves, style: style)
        scaleList.append(scale)
    }
    
    func addArpeggio(key: Int, tonality: Int, octaves: Int, style: Int, inversion: Int, type: Int) {
        let arpeggio = Arpeggio(key: key, tonality: tonality, octaves: octaves, style: style, inversion: inversion, type: type)
        arpeggioList.append(arpeggio)
    }
    
}
