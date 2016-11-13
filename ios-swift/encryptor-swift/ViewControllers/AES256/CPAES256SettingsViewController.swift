//
//  CPAES256SettingsViewController.swift
//  encryptor-swift
//
//  Created by Pavlo Cretsu on 11/12/16.
//  Copyright © 2016 Pavlo Cretsu. All rights reserved.
//

import UIKit

class CPAES256SettingsViewController: UIViewController {

    @IBOutlet weak var keyFld: UITextField!
    
    @IBOutlet weak var ivFld: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyFld.text = Configuration.aesKey
        ivFld.text = Configuration.aesIV
    }
}
