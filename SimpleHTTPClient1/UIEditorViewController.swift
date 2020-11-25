//
//  UIEditorViewController.swift
//  SimpleHTTPClient1
//
//  Created by Guest User on 11/24/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import Foundation
import UIKit

class UIEditorViewController: UIViewController {
    
    @IBOutlet var clmTitleField : UITextField!
    @IBOutlet var dateField : UITextField!
    @IBOutlet var statusText : UILabel!
    
    var cService: ClaimDao!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let error = "no "
        if (clmTitleField.text == "" || dateField.text == "") {
            statusText.text = "Please enter info!"
        } else{
            let pObj = Claim(tl:clmTitleField.text, dt:dateField.text)
            //cService = ClaimDao()
            //cService.addClaim(pObj: pObj)
            statusText.text = "\(clmTitleField.text ?? error) claim submitted."
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //populate claim title and date
        clmTitleField.text = "Motorcycle accident"
        dateField.text = "01/15/2020"
        statusText.text = " "
        
        
        
        

    }
}
