//
//  CPRSA2048Manager.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation
import SwiftyRSA

class RSA2048Manager {
    
    static let shared = RSA2048Manager()
    
    private let publicKey: SecKey = Configuration.rsaPublicKey
    
    private let privateKey: SecKey = Configuration.rsaPrivateKey
    
    private let rsa = SwiftyRSA()

    
    private init() { }
    
    func encrypt(string: String) throws -> String? {
        let encryptedString = try! rsa.encryptString(string, publicKey: publicKey)
        return encryptedString
    }
    
    func decrypt(string: String) throws -> String? {
        let decryptedString = try! rsa.decryptString(string, privateKey: privateKey)
        return decryptedString
    }
}
