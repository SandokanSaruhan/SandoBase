//
//  SixthViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class SixthViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    
    let cellId = "cellId"
    var tempArray = ["iPhone", "Macbook", "iPad", "iMac", "AirPods", "Apple Watch"]
    var filteredArray = [String]()
    var isSearching = false
    
    lazy var mainTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()
    
    let mainSearchBar = MainSearchBar()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("SearchBar Page")
        print("SixthViewController Page")
        
        setupView()
        self.mainTable.delegate = self
        self.mainTable.dataSource = self
        mainSearchBar.delegate = self
        mainSearchBar.returnKeyType = UIReturnKeyType.done
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        
        
        self.designBackButton()
    }
    
    // MARK: Design Methods
    func designBackButton() {
        let backImage = UIImage(named: "back-button")
        let backButton = UIButton(type: .system)
        backButton.tintColor = .gray
        backButton.backgroundColor = .clear
        backButton.setBackgroundImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(pageAction(_:)), for: .touchUpInside)
        backButton.frame = CGRect(x: 10, y: 40, width: 30, height: 30)
        backButton.tag = 1
        self.view.addSubview(backButton)
    }
    
    // MARK: Actions Methods
    @IBAction func pageAction(_ sender: UIButton){
        switch (sender.tag) {
        case 1:
            print("1")
            self.backPage()
        default:
            print("Default")
        }
    }
    
    func backPage() {
        print("Back Page")
        
        dismiss(animated: true)
        
        // Call Another View Controller
        // let VC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        // VC.modalPresentationStyle = .overCurrentContext //Sando Screen
        // self.present(VC, animated: true, completion: nil)
    }
    
    // MARK: Search Methods
    fileprivate func setupView(){
        view.addSubview(mainSearchBar)
        view.addSubview(mainTable)
        
        mainSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        mainSearchBar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mainSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        mainTable.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 10).isActive = true
        mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


