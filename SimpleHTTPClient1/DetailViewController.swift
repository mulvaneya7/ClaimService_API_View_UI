//
//  DetailViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/4/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class DetailViewController : ViewController {

    override func refreshScreen(pObj: Person) {
        //
        detailScreenGenerator.vals[0].text = pObj.firstName
        detailScreenGenerator.vals[1].text = pObj.lastName
        detailScreenGenerator.vals[2].text = pObj.ssn
        
        // Enable/Disable the button
        detailScreenGenerator.nextBtn.isEnabled = !pService.isLastEntry()
        // Change the brightness if needed
        if detailScreenGenerator.nextBtn.isEnabled {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(1.0)
        } else {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(0.3)
        }
    }

    var detailScreenGenerator : PersonDetailScreenGenerator!
    var currentPersonIndx : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create screen
        detailScreenGenerator = PersonDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        //pService = PersonService(vc : self)
        //pService.getAll()
        
        // 3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(goNextPerson(sender:)), for: .touchUpInside)

        //print("\(currentPerson)")
        pService = PersonService.getInstance(vc: self)
        let pObj = pService.fetchAt(currentPersonIndx)
        print("\(pObj)")
        refreshScreen(pObj: pObj)
    }
}
