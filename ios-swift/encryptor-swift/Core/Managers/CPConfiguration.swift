//
//  CPConfiguration.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation
import KeychainSwift
import SwiftyRSA


struct SettingKey {
    static let aesKey           = "aesEncryptionKey"
    static let aesIV            = "aesEncryptionIV"
    static let rsaPublicKey     = "rsaPublicKey"
    static let rsaPrivateKey    = "rsaPrivateIV"
}

class Configuration {
    
    static let shared = Configuration()
    
    let keychain = KeychainSwift()
    
    let rsa = SwiftyRSA()
    
    class var aesKey:String {
        get {
            let stored = Configuration.shared.keychain.get(SettingKey.aesKey)
            if (stored?.characters.count != AES256Manager.keyLength) {
                let random = String.random()
                Configuration.shared.keychain.set(random, forKey: SettingKey.aesKey)
                
                return random
            }
            
            return stored!
        }
    }
    
    class var aesIV:String {
        get {
            let stored = Configuration.shared.keychain.get(SettingKey.aesIV)
            
            if (stored?.characters.count != AES256Manager.keyLength) {
                let random = String.random()
                Configuration.shared.keychain.set(random, forKey: SettingKey.aesIV)
                
                return random
            }
            
            return stored!
        }
    }
    
    class var rsaPublicKey:SecKey {
        get {
            let pubPath   = Bundle.main.path(forResource: "public", ofType: "pem")!
            let pubString = try! String(contentsOfFile: pubPath)
            let pubKey    = try! Configuration.shared.rsa.publicKeyFromPEMString(pubString)
            return pubKey
        }
    }
    
    class var rsaPrivateKey:SecKey {
        get {
            let privPath   = Bundle.main.path(forResource: "private", ofType: "pem")!
            let privString = try! String(contentsOfFile: privPath)
            let privKey    = try! Configuration.shared.rsa.privateKeyFromPEMString(privString)
            return privKey

        }
    }
}
