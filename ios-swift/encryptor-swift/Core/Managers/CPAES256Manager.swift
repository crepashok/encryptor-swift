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
    
    public static let keyLength = 32
    
    private let key: String = Configuration.aesKey
    
    private let iv:  String = Configuration.aesIV
    
    private init() { }
    
    func encrypt(string: String, localKey: String? = nil, localIV: String? = nil) throws -> String? {
        if let data = string.data(using: .utf8) {
            let localKey = localKey ?? key
            let localIV = localIV ?? iv
            let enc = try AES(key: localKey, iv: localIV, blockMode:.CBC).encrypt(data.bytes)
            let encData = NSData(bytes: enc, length: Int(enc.count))
            let base64String: String = encData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0));
            let result = String(base64String)
            return result
        }
        return .none
    }
    
    func decrypt(string: String, localKey: String? = nil, localIV: String? = nil) throws -> String? {
        if let data = Data(base64Encoded: string, options: Data.Base64DecodingOptions(rawValue: 0)) {
            let localKey = localKey ?? key
            let localIV = localIV ?? iv
            let dec = try AES(key: localKey, iv: localIV, blockMode:.CBC).decrypt(data.bytes)
            let decData = NSData(bytes: dec, length: Int(dec.count))
            if let result = NSString(data: decData as Data, encoding: String.Encoding.utf8.rawValue) {
                return String(result)
            } else {
                print("AES 256 decryption error!")
            }
        }
        return .none
    }
}
