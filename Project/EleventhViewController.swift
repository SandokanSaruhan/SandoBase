//
//  EleventhViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import Foundation
import UIKit

class EleventhViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    @IBOutlet var backButton: UIButton!
    
    // NavBar
    var theButtonsArray: Array<Any>!
    
    // Create Dynamic Views Page
    var theActionId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("Create Dynamic Views Page - Navbar")
        print("EleventhViewController Page")
        
        // self.createNavBar()
        self.designBackButton()
    }
    
    // MARK: Data Methods
    func collectData() {
        var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
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
    
    // NavBar
    func createNavBar() {
        
        // let myViewX = 0
        let NBViewY = screenSize.height*3/10
        let NBViewW = screenSize.width
        let NBViewH = screenSize.height*7/10
        
        let NBView = UIView(frame: CGRect(x: 0, y: NBViewY, width: NBViewW, height: NBViewH))
        NBView.backgroundColor = .orange
        self.view.addSubview(NBView)
        
        let image = UIImage(named: "button")
        
        let value = (Int(NBViewH)-100)/(theButtonsArray.count)
        // print("value of button: \(value as Any)")
        
        for i in 0..<theButtonsArray.count {
            // let str = "\(i)."
            
            var theButtonsDictionary = [String: Any]()
            theButtonsDictionary = theButtonsArray[i] as! [String : Any]
            let str = (theButtonsDictionary["title"] as! String)
            theActionId = (theButtonsDictionary["id"] as! String)
            
            let theButton = UIButton(frame: CGRect(x: (Int(screenSize.width*0.10)), y: 100+i*value, width: (Int(screenSize.width*0.8)) , height: 50))
            theButton.setTitle(str, for: .normal)
            theButton.tintColor = .white
            theButton.titleLabel?.font = UIFont.init(name: Constants.bold_Font, size:12)
            theButton.titleLabel!.numberOfLines = 1
            theButton.titleLabel!.adjustsFontSizeToFitWidth = true
            theButton.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
            theButton.titleLabel?.lineBreakMode = .byWordWrapping
            theButton.titleLabel?.textAlignment = .left
            theButton.titleLabel?.numberOfLines = 0 // for Multi line text
            theButton.setBackgroundImage(image, for: .normal)
            theButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            theButton.tag = i
            
            NBView.addSubview(theButton)
        }
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
    
    // NavBar
    @objc func buttonAction(sender: UIButton!) {
        
        // if (theActionId == ){
        // Navigation to controller by data
        // }
        
    }
}

// https://medium.com/@lukesimoncurtis/parsing-json-to-dictionary-in-swift-4-from-an-api-3589df6aa5cf
/*
{
    "exist": "true",
    "id": 32,
    "name": "Yarışma 1-",
    "startdt": "2020-07-02T00:09:00",
    "questions": [
    {
    "id": 1,
    "question": "Açı genişliğinin derecelendirmesinde hangi sınıflama kullanılmaz?",
    "point": 10,
    "duration": 20,
    "endqdate": "2020-07-02T00:09:20",
    "rid": 4,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Shaffer"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Spaeth"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Van Herick"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Goldmann"
    }
    ]
    },
    {
    "id": 2,
    "question": "Keratokonus hastalığı gözün hangi bölümü ile ilgilidir?",
    "point": 10,
    "duration": 20,
    "endqdate": "2020-07-02T00:09:40",
    "rid": 2,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Lens"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Kornea"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Konjonktiva"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Retina"
    }
    ]
    },
    {
    "id": 3,
    "question": "Hangi kemik iç orbital duvarın oluşumuna katılmaz?",
    "point": 10,
    "duration": 20,
    "endqdate": "2020-07-02T00:10:00",
    "rid": 4,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Maksillar"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Etmoid"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Lakrimal"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Frontal"
    }
    ]
    },
    {
    "id": 4,
    "question": "Hangisi oftalmik sinirin dalı değildir?",
    "point": 10,
    "duration": 20,
    "endqdate": "2020-07-02T00:10:20",
    "rid": 3,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Nazosiliyer sinir"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Frontal sinir"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Temporal sinir"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Lakrimal sinir"
    }
    ]
    },
    {
    "id": 5,
    "question": "Göz kapaklarının sekretuar bezlerinden hangisi Apokrin tiptir?",
    "point": 10,
    "duration": 20,
    "endqdate": "2020-07-02T00:10:40",
    "rid": 2,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Zeis"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Moll"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Meibomian"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Lakrimal"
    }
    ]
    },
    {
    "id": 6,
    "question": "Aşağıdaki moleküllerden hangisinin  nöroprotektif etkiye sahip olduğu düşünülmektedir?",
    "point": 12,
    "duration": 20,
    "endqdate": "2020-07-02T00:11:00",
    "rid": 1,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Brimonidin"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Latanaprost"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Bimatoprost"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Brinzolamid"
    }
    ]
    },
    {
    "id": 7,
    "question": "Gözyaşı filmini oluşturan tabakaların, dışarıdan korneal yüzeye doğru sıralanışı nasıldır?",
    "point": 12,
    "duration": 20,
    "endqdate": "2020-07-02T00:11:20",
    "rid": 1,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Lipid, Aköz, Müsin"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Lipid, Müsin, Aköz"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Müsin, Aköz, Lipid"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Aköz, Müsin, Lipid"
    }
    ]
    },
    {
    "id": 8,
    "question": "Konjenital nazolakrimal kanal tıkanıklığında tıkanıklığa neden olan yer hangisidir?",
    "point": 12,
    "duration": 20,
    "endqdate": "2020-07-02T00:11:40",
    "rid": 2,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Rosenmüller valvi"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Hasner valvi"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Müller valvi"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Krause valvi"
    }
    ]
    },
    {
    "id": 9,
    "question": "Fundus oto floresans görüntülemeyle gözün hangi yapısının incelenmesi sağlanır?",
    "point": 15,
    "duration": 20,
    "endqdate": "2020-07-02T00:12:00",
    "rid": 3,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Rod"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "Kon"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "RPE"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Ganglion hücreleri"
    }
    ]
    },
    {
    "id": 10,
    "question": "Elektrookülografi (EOG) hangi ilacın retinal toksisitesinin incelenmesinde faydalıdır?",
    "point": 15,
    "duration": 20,
    "endqdate": "2020-07-02T00:12:20",
    "rid": 4,
    "answers": [
    {
    "id": 1,
    "option": "a",
    "answer": "Amiodaron"
    },
    {
    "id": 2,
    "option": "b",
    "answer": "İzoniazid"
    },
    {
    "id": 3,
    "option": "c",
    "answer": "Fenotiyazin"
    },
    {
    "id": 4,
    "option": "d",
    "answer": "Klorokin"
    }
    ]
    }
    ]
}
*/
