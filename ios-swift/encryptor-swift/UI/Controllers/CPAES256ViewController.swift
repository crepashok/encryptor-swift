//
//  CPAES256ViewController.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/12/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import UIKit

class CPAES256ViewController: UIViewController {
    
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
            if let encrypted = try AES256Manager.shared.encrypt(string: inputTextView.text) {
                outputTextView.text = encrypted
            }
        } catch {
            
        }
    }
    
    
    private func decodeOutput() {
        do {
            if let decrypted = try AES256Manager.shared.decrypt(string: outputTextView.text) {
                inputTextView.text = decrypted
            }
        } catch {
            
        }
    }
}
