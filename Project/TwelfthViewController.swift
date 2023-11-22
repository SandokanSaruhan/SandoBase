//
//  TwelfthViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class TwelfthViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    @IBOutlet var backButton: UIButton!
    
    // CollectionView
    var myCollectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  Info
        print("Collection List View Page")
        print("TwelfthViewController Page")
        
        
        self.createCollectionView()
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
    
    // CollectionView
    func createCollectionView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: screenSize.width-20, height: 60)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = UIColor.white
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
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
        /*
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        VC.modalPresentationStyle = .overCurrentContext //Sando Screen
        self.present(VC, animated: true, completion: nil)
        */
    }
    
    // NavBar
    @objc func buttonAction(sender: UIButton!) {
        
        // if (theActionId == ){
        // Navigation to controller by data
        // }
        
    }
}

// CollectionView
extension TwelfthViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.lightGray
        myCell.layer.cornerRadius = 8.0
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: myCell.bounds.size.width, height: 30))
        title.text = "Some random text"
        title.font = UIFont.init(name: Constants.regular_Font, size:12)
        title.numberOfLines = 1
        title.adjustsFontSizeToFitWidth = true
        title.lineBreakMode = NSLineBreakMode.byClipping
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .left
        title.numberOfLines = 0 // for Multi line text
        
        switch indexPath.row {
        case 0:
            
            title.text = "SearchBar Page - SixthViewController"
            
        case 1:
            
            title.text = "Take & Pick Photo Page - FourthViewController"
            
        case 2:
            
            title.text = "QR Code Reader Page - FifthViewController"
            
        case 3:
            
            title.text = "Carousel Page - SeventhViewController"
            
        case 4:
            
            title.text = "Map Page - EighthViewController"
            
        case 5:
            
            title.text = "Generate QrCode - NinthViewController"
            
        case 6:
            
            title.text = "Create Scroll Views Page - TenthViewController"
            
        case 7:
            
            title.text = "Create Dynamic Views Page - Navbar - EleventhViewController"
            
        case 8:
            
            title.text = "List View Page - TwelfthViewController"
            
        case 9:
            
            title.text = "Barcode Reader - ThirteenthViewController"
            
        case 10:
            
            title.text = "FourteenthViewController"
            
        case 11:
            
            title.text = "FifteenthViewController"
            
        case 12:
            
            title.text = "SixteenthViewController"
            
        default:
            print("define it")
        }
        
        
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textAlignment = .center
        myCell.contentView.addSubview(title)
        
        return myCell
    }
}

extension TwelfthViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "SixthViewController") as! SixthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 1:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 2:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 3:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "SeventhViewController") as! SeventhViewController
            self.present(VC, animated: true, completion: nil)
            
        case 4:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "EighthViewController") as! EighthViewController
            self.present(VC, animated: true, completion: nil)
            
        case 5:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "NinthViewController") as! NinthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 6:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "TenthViewController") as! TenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 7:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "EleventhViewController") as! EleventhViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 8:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "TwelfthViewController") as! TwelfthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 9:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ThirteenthViewController") as! ThirteenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 10:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "FourteenthViewController") as! FourteenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 11:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "FifteenthViewController") as! FifteenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        case 12:
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "SixteenthViewController") as! SixteenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            
        default:
            print("define it")
        }
    }
}
