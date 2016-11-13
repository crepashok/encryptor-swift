//
//  CPRSA2048ViewController.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/13/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import UIKit

class CPRSA2048ViewController: UIViewController {
    
    @IBOutlet weak var randomizeBtn: UIButton!
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var outputTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeInput(randomizeBtn)
    }

    
    @IBAction func clearInput(_ sender: UIButton) {
        inputTextView.text = .none
        encodeInput()
    }
    
    
    @IBAction func randomizeInput(_ sender: UIButton) {
        inputTextView.text = CPDummyManager.getRandomQuote()
        encodeInput()
    }
    
    
    @IBAction func encodeInput(_ sender: UIButton) {
        encodeInput()
    }
    
    
    @IBAction func clearResult(_ sender: UIButton) {
        outputTextView.text = .none
        decodeOutput()
    }
    
    
    @IBAction func decodeResult(_ sender: UIButton) {
        decodeOutput()
    }
    
    
    private func encodeInput() {
        do {
            if let encrypted = try RSA2048Manager.shared.encrypt(string: inputTextView.text) {
                outputTextView.text = encrypted
            }
        } catch {
            print("Encoding error: \(error.localizedDescription)")
        }
    }
    
    
    private func decodeOutput() {
        do {
            if let decrypted = try RSA2048Manager.shared.decrypt(string: outputTextView.text) {
                inputTextView.text = decrypted
            }
        } catch {
            print("Decoding error: \(error.localizedDescription)")
        }
    }
}
