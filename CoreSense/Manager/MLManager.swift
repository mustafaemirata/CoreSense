//
//  MLManager.swift
//  CoreSense
//
//  Created by Mustafa Emir Ata on 14.03.2026.
//

import Foundation
import NaturalLanguage

struct MLManager {
    static func duyguAnaliziYap(metin: String) -> String {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = metin
        
        let (sentiment, _) = tagger.tag(at: metin.startIndex, unit: .paragraph, scheme: .sentimentScore)
        
        guard let score = sentiment?.rawValue, let scoreDouble = Double(score) else {
            return "Analiz edilemedi "
        }
        
        if scoreDouble > 0.1 { return "Pozitif  (\(scoreDouble))" }
        else if scoreDouble < -0.1 { return "Negatif  (\(scoreDouble))" }
        else { return "Nötr 😐" }
    }
}
