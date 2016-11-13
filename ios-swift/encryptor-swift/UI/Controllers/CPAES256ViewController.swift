//
//  CPAES256ViewController.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/12/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import UIKit

class CPAES256ViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: UITextView!

    @IBOutlet weak var outputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearInput(_ sender: UIButton) {
        inputTextView.text = .none
    }
    
    
    @IBAction func randomizeInput(_ sender: UIButton) {
        inputTextView.text = CPDummyManager.getRandomQuote()
    }
    
    
    @IBAction func encodeInput(_ sender: UIButton) {
        print("Prepare for encoding of:: \(inputTextView.text)")
    }

    
    @IBAction func clearResult(_ sender: UIButton) {
        outputTextView.text = .none
    }
    
    
    @IBAction func decodeResult(_ sender: UIButton) {
        print("Prepare for decoding of:: \(inputTextView.text)")
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let segueID = segue.identifier else {
//            print("Unable to perform segue because of no segue identifier")
//            return
//        }
//        switch segueID {
//        case "show-aes256-settings":
//            print("Prepare data for AES 256 algorithm")
//        default:
//            return
//        }
    }
}
