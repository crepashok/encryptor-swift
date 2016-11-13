//
//  String.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation

extension String {
    
    static func random(length: Int = 16) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
