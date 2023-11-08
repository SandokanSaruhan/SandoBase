//
//  SixteenthViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class SixteenthViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    @IBOutlet var backButton: UIButton!
    var passedString: String = "" // Detail Passed Data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("SixteenthViewController Page")
        
        // Test
        let noteLabel = UILabel(frame: CGRect(x: 50, y: screenSize.width/4, width: screenSize.width/2, height: 50))
        noteLabel.text = passedString
        noteLabel.font = UIFont(name:Constants.digital_Font, size: 32.0)
        noteLabel.textColor = .red
        noteLabel.textAlignment = NSTextAlignment.center
        noteLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(noteLabel)
        
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
        // self.present(VC, animated: true, completion: nil)
    }
}
