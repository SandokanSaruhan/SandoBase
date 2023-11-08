//
//  TenthViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class TenthViewController: UIViewController, UIScrollViewDelegate{
    
    let screenSize: CGRect = UIScreen.main.bounds
    @IBOutlet var backButton: UIButton!
    
    // ScrollView
    var scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("Create Scroll Views Page")
        print("TenthViewController Page")
        
        self .createScrollView()
        self.designBackButton()
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
    
    // MARK: Design Methods
    // ScrollView
    func createScrollView() {
        // Set the scrollView's frame to be the size of the screen
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.width))
        scrollView.backgroundColor = .red
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.width*4)
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        let useInScrollViewX = screenSize.width
        // let useInScrollViewY = 0
        let useInScrollNBViewW = screenSize.width
        let useInScrollNBViewH = screenSize.width
        
        let useInScrollView1 = UIView(frame: CGRect(x: useInScrollViewX*0, y: useInScrollViewX*0, width: useInScrollNBViewW, height: useInScrollNBViewH))
        useInScrollView1.backgroundColor = .black
        scrollView.addSubview(useInScrollView1)
        
        let useInScrollView2 = UIView(frame: CGRect(x: useInScrollViewX*0, y: useInScrollViewX*1 , width: useInScrollNBViewW, height: useInScrollNBViewH))
        useInScrollView2.backgroundColor = .lightGray
        scrollView.addSubview(useInScrollView2)
        
        let useInScrollView3 = UIView(frame: CGRect(x: useInScrollViewX*0, y: useInScrollViewX*2 , width: useInScrollNBViewW, height: useInScrollNBViewH))
        useInScrollView3.backgroundColor = .blue
        scrollView.addSubview(useInScrollView3)
    }
}

// https://medium.com/@anitaa_1990/create-a-horizontal-paging-uiscrollview-with-uipagecontrol-swift-4-xcode-9-a3dddc845e92
