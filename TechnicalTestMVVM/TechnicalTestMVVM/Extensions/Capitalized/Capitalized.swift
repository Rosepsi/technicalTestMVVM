//
//  Capitalized.swift
//  TechnicalTestMVVM
//
//  Created by Rosa Herrero on 10/1/23.
//

import Foundation

extension String {
    
    var firstCapitalized: String {
        guard let first = first else { return "" }
        return String(first).capitalized + dropFirst()
    }

}
