//
//  CPAES256Manager.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import Foundation
import CryptoSwift

class AES256Manager {
    
    static let shared = AES256Manager()
    
    public static let keyLength = 16
    
    private let key: String = Configuration.aesKey
    
    private let iv:  String = Configuration.aesIV
    
    private init() { }
    
    func encrypt(string: String) throws -> String? {
        if let data = string.data(using: .utf8) {
            let enc = try AES(key: key, iv: iv, blockMode:.CBC).encrypt(data.bytes)
            let encData = NSData(bytes: enc, length: Int(enc.count))
            let base64String: String = encData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0));
            let result = String(base64String)
            return result
        }
        return .none
    }
    
    func decrypt(string: String) throws -> String? {
        if let data = Data(base64Encoded: string, options: Data.Base64DecodingOptions(rawValue: 0)) {
            let dec = try AES(key: key, iv: iv, blockMode:.CBC).decrypt(data.bytes)
            let decData = NSData(bytes: dec, length: Int(dec.count))
            let result = NSString(data: decData as Data, encoding: String.Encoding.utf8.rawValue)
            return String(result!)
        }
        return .none
    }
}
