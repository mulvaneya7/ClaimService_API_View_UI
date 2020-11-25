//
//  SummaryViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/10/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class SummaryViewController : ViewController {
    var tblView : UITableView!
    //var pService : PersonService!

    func refreshScreen1() {
        //
        tblView.reloadData()
    }
    
    override func viewDidLoad() {
        // 1. Create UITableView object
        tblView = UITableView()
        view.addSubview(tblView)
        
        // Set Auto Layout constraints
        tblView.translatesAutoresizingMaskIntoConstraints = false
        let constr = tblView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let constr1 = tblView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let constr2 = tblView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let constr3 = tblView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        constr.isActive = true
        constr1.isActive = true
        constr2.isActive = true
        constr3.isActive = true

        //2. register the cell
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //3. Set the delegate object
        tblView.dataSource = self
        tblView.delegate = self
        
        // get Data
        pService = PersonService.getInstance(vc: self)
        pService.getAll()
    }
}

extension SummaryViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pService.personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (pService.personList[indexPath.row]).firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("User click \(indexPath.row) table entry. ")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let navController = appDelegate.window?.rootViewController as! UINavigationController
        //let detailVC = DetailViewController()
        //let pObj = pService.personList[indexPath.row]
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailedVC") as! DetailViewController
        detailVC.currentPersonIndx = indexPath.row
        navController.pushViewController(detailVC, animated: true)
    }
}
