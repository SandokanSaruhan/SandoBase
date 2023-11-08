//
//  SecondViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    @IBOutlet var backButton: UIButton!
    
    var animationDurationData: Int!
    @IBOutlet var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("Left Sided Menu Page")
        print("SecondViewController Page")
        
        
        
        animationDurationData = 0
        
        self.createNewView()
        // self.designBackButton()
        
        // Gesture Recognizer
        self.view.isUserInteractionEnabled = true
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionViewPage))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    // MARK: Design Methods
    func createNewView() {
        // Navbar
        // let NBViewX = 0
        // let NBViewY = 0
        let NBViewW = screenSize.width
        // let NBViewH = 40
        
        let NBView = UIView(frame: CGRect(x: 0, y: 0, width: NBViewW, height: 60))
        NBView.backgroundColor = .black
        self.view.addSubview(NBView)
        
        let button = UIButton()
        button.frame = CGRect(x: (screenSize.width - 80), y: 10, width: 60, height: 30)
        button.backgroundColor = UIColor.lightGray
        button.setTitle(" Slide", for: .normal)
        button.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        button.tag  = 1
        button.layer.cornerRadius = 8.8
        NBView.addSubview(button)
        
        if myView != nil {
            myView.removeFromSuperview()
        }
        
        // let myViewX = 0
        // let myViewY = 0
        let myViewW = screenSize.width*7/10
        let myViewH = screenSize.height
        
        myView = UIView(frame: CGRect(x: 0, y: 40, width: myViewW, height: myViewH))
        myView.backgroundColor = .lightGray
        myView.layer.cornerRadius = 8.8
        self.view.addSubview(myView)
        
        let actionPageButton = UIButton()
        actionPageButton.frame = CGRect(x: 0, y: 60, width: myViewW, height: 30)
        actionPageButton.backgroundColor = UIColor.black
        actionPageButton.setTitle("Menu Button ", for: .normal) // Test Language
        actionPageButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        actionPageButton.tag  = 2
        self.myView.addSubview(actionPageButton)
    }
    
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
    
    // MARK: Action Methods
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
        /*
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        VC.modalPresentationStyle = .overCurrentContext //Sando Screen
        self.present(VC, animated: true, completion: nil)
        */
    }
    
    @IBAction func startAction(_ sender: UIButton){
        switch (sender.tag) {
        case 1:
            print("1")
            self.actionViewPage()
        case 2:
            print("2")
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        default:
            print("Back Page")
        }
    }
    
    @objc func actionViewPage() {
        let myViewX = -screenSize.width
        // let myViewY = 40
        let myViewW = screenSize.width*7/10
        let myViewH = screenSize.height-40
        
        if (animationDurationData != 0){
            animationDurationData = 0
            
            // Animate View
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.myView.frame = CGRect(x: 0, y: 40, width: myViewW, height: myViewH)
                // self.myView.alpha = 1
            }, completion: nil)
        }
        else{
            animationDurationData = 1
            
            // Animate View
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.myView.frame = CGRect(x: myViewX, y: 40, width: myViewW, height: myViewH)
                // self.myView.alpha = 0
            }, completion: nil)
        }
    }
}

// https://github.com/matteocrippa/awesome-swift

// Test Adding Gestures
// https://medium.com/@halilozel1903/ios-programlamada-gesture-recognizer-jest-alg%C4%B1lay%C4%B1c%C4%B1lar-kullan%C4%B1m%C4%B1-835450845680

// Test Carousel
// https://medium.com/@anitaa_1990/create-a-horizontal-paging-uiscrollview-with-uipagecontrol-swift-4-xcode-9-a3dddc845e92

// Test QR

// Test Photo

// Test Map

// Test Localization

// Test 

// Dynamic design by backend - scrollview - textview - video view

// SignOut method


