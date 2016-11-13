//
//  CPAES256Manager.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation

class AES256Manager {
    
    static let shared = AES256Manager()
    
    private let key: String = "drowssapdrowssapdrowssapdrowssap"
    
    private let iv:  String = "drowssapdrowssapdrowssapdrowssap"
    
    init() { }
    
    public func encrypt(text: String) -> String? {
        do {
            let aes = try AES(key: key, iv: iv)
            let encripted = try aes.encrypt(text.utf8.map({$0}))
        } catch {
            print(error)
        }
    }
}
