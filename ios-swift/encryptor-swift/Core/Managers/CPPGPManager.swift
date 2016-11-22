//
//  CPPGPManager.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/22/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation

class CPPGPManager {
    
    static let shared = CPPGPManager()
    
    private init() { }

    internal func encode(string: String) -> String {
        let key = try! RSA2048Manager.shared.encrypt(string: Configuration.aesKey)!
        let iv = try! RSA2048Manager.shared.encrypt(string: Configuration.aesIV)!
        let text = try! AES256Manager.shared.encrypt(string: string)!
        let result = "\(text)+ +\(key)+ +\(iv)"
        return result
    }

    internal func decode(string: String) -> String? {
        let data = string.components(separatedBy: "+ +").flatMap{ $0 }
        if data.count == 3 {
            let key = try! RSA2048Manager.shared.decrypt(string: data[1])!
            let iv = try! RSA2048Manager.shared.decrypt(string: data[2])!
            let text = try! AES256Manager.shared.decrypt(string: String(data[0]), localKey: key, localIV:iv)!
            return text
        } else {
            print("Received data don't conform with predefined requirements")
        }
        
        return .none
    }
}
