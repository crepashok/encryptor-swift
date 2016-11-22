//
//  CPPGPViewController.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/22/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import UIKit

class CPPGPViewController: UIViewController {

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
        // Message encryption
        let encrypted = CPPGPManager.shared.encode(string: inputTextView.text!)
        outputTextView.text = encrypted
    }
    
    
    private func decodeOutput() {
        // Message decryption
        if let decrypted = CPPGPManager.shared.decode(string: outputTextView.text!) {
            inputTextView.text = decrypted
        }
    }
}
