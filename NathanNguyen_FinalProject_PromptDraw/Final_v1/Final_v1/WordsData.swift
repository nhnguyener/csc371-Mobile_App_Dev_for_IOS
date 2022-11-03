//
//  WordsData.swift
//  Final_v1
//
//  Created by Nathan Nguyen on 3/12/22.
//

import Foundation

class WordsData: NSObject {
    var title =
    ["nouns",
     "adjectives"]
    
    var words =
    ["bread\nfish\nfinger\ngun",
     "elegant\nglamorous\nshiny\nnice"]
    
    func count() -> Int {
        return title.count
    }
}
