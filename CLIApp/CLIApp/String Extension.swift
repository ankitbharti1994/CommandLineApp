//
//  String Extension.swift
//  CLIApp
//
//  Created by Ankit Kumar Bharti on 01/08/18.
//  Copyright © 2018 Exilant. All rights reserved.
//

import Foundation

extension String {
    func isAnagramOf(_ s: String) -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "")
        return lowerSelf.sorted() == lowerOther.sorted()
    }
    
    func isPalindrome() -> Bool {
        let f = self.lowercased().replacingOccurrences(of: " ", with: "")
        let s = String(f.reversed())
        return  f == s
    }
}
