//
//  ParseData.swift
//  
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation
import UIKit

struct LoginData: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    let access_token: String
    let token_type: String
    let expires_in: String
}

struct UserData: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    let exist: String
    let id: Int
    let name: String
    let surname: String
    let email: String
    let score: Int
    let attended: Int
}

struct CompetitonData: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    let exist: String
    let id: Int
    let name: String
    let startdt: String
    let serverdt: String
}

struct QuestionsData: Decodable {
    
    let exist: String?
    let id: Int?
    let name: String?
    let startdt: String?
    let questions: Questions?
}

struct Questions: Decodable {
    let id: Int?
    let question: String?
    let point: Int?
    let duration: Int?
    let endqdate: String?
    let rid: Int?
    let answers: Answers?
}

struct Answers: Decodable {
    let id: Int?
    let option: String?
    let answer: String?
}

// MARK: Delegate Method
protocol ParseSendDataDelegate: class {
    func didReceiveTokenData(_ data: String)
    func didReceiveUserData(_ data: String)
    func didReceiveCompetitionData(_ data: String)
    func didReceiveResetStatusData(_ data: String)
    func didReceiveUpdateStatusData(_ data: String)
}

public class ParseSendData {
    static var theToken: String!
    
    static var userExist: String!
    static var userName: String!
    static var userSurname: String!
    static var userEmail: String!
    static var userScore: Int!
    
    static var cExist: String!
    static var cName: String!
    static var cDate: String!
    static var sDate: String!
    static var cId: Int!
    
    static var theQuestions: Array<Any>!
    
    static var resetStatus: String!
    static var updateStatus: String!
    
    // MARK: Delegate Method
    static var theCounter = 0
    static var theRepeat = 60000
    
    // MARK: Parsed Data Login
    class func loginDataParse(data: Data)-> String {
        
         print(data)
         let dataString = String(data: data, encoding: .utf8)
         print("data: \(dataString ?? "sando")")
        
        do {
            
            let loginData: LoginData = try! JSONDecoder().decode(LoginData.self, from: data)
            print(loginData.access_token)
            
            theToken = loginData.access_token
            
            // MARK: The UDID
            let theUdid = GetUid.theUdid()
            // let theDelegate = UIApplication.shared.delegate as! AppDelegate
            // let theUdid = theDelegate.deviceTokenForPush
            print("udid: \(String(describing: theUdid))")
            
            // MARK: Get Defaults
            let defaults = UserDefaults.standard
            if defaults.string(forKey: "UserName") != nil{
                let theUser = (defaults.object(forKey: "UserName") as! String)
                // MARK: Service Get User Information
                PostGetData.GetUserData(token: theToken, user:theUser)
            }
            
            // Note: This Method is not in use
            // MARK: Local Notification
            NotificationCenter.default.post(name: Notification.Name("loginNotif"), object: nil)
            
            // MARK: Service Competition
            PostGetData.GetCompetitionData(token: theToken)
            
            return theToken
        }
    }
    
    // MARK: Parsed Data User Information
    class func getUserDataParse(data: Data){
        // print(data)
        // let dataString = String(data: data, encoding: .utf8)
        // print("data: \(dataString ?? "sando")")
    
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            //print(jsonResponse)
            
            guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                throw NSError()
            }
            
            print(dataDictionary["exist"] as Any)
            userExist = (dataDictionary["exist"] as! String)
            
            if userExist == "true"{
                let userData: UserData = try! JSONDecoder().decode(UserData.self, from: data)
                print(userData.exist)
                
                userName = userData.name
                userSurname = userData.surname
                userEmail = userData.email
                userScore = userData.score
            }
            
            // Note: This Method is not in use
            // MARK: Local Notification
            NotificationCenter.default.post(name: Notification.Name("designNotif"), object: nil)
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    // MARK: Parsed Data For Competiton
    class func getCompetitionDataParse(data: Data){
        // print(data)
        // let dataString = String(data: data, encoding: .utf8)
        // print("data: \(dataString ?? "sando")")
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            // print(jsonResponse) 
            
            guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                throw NSError()
            }
            
            print(dataDictionary["exist"] as Any)
            cExist = (dataDictionary["exist"] as! String)
            
            if cExist == "true"{
                let competitonData: CompetitonData = try! JSONDecoder().decode(CompetitonData.self, from: data)
                print(competitonData.exist)
                
                cName = competitonData.name
                cDate = competitonData.startdt
                sDate = competitonData.serverdt
                cId = competitonData.id
                print("competition date : \(String(describing: cDate))")

                // MARK: Service Questions
                let theCid = String(cId)
                PostGetData.GetQuestionsData(token:theToken, cid:theCid)
            }
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    // MARK: Parsed Data Questions
    class func questionsDataParse(data: Data){
        // print(data)
        // let dataString = String(data: data, encoding: .utf8)
        // print("data: \(dataString ?? "sando")")
        
        do {
            // let questionsData = try JSONDecoder().decode(QuestionsData.self, from: data)
            // print(questionsData)
            
            // let questionsDataOther = try JSONDecoder().decode([QuestionsData].self, from: data)
            // print(questionsDataOther)
            
            
            
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            // print(jsonResponse)
            
            guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                throw NSError()
            }
            
            // print(dataDictionary["questions"] as Any)
            theQuestions = (dataDictionary["questions"] as! Array<Any>)
            
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    // MARK: Parsed Data For Reset
    class func getResetDataParse(data: Data){
        // print(data)
        // let dataString = String(data: data, encoding: .utf8)
        // print("data: \(dataString ?? "sando")")
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            // print(jsonResponse)
            
            guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                throw NSError()
            }
            
            print(dataDictionary["status"] as Any)
            resetStatus = (dataDictionary["status"] as! String)
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    // MARK: Parsed Data For Update
    class func getUpdateDataParse(data: Data){
        // print(data)
        // let dataString = String(data: data, encoding: .utf8)
        // print("data: \(dataString ?? "sando")")
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
            // print(jsonResponse)
            
            guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                throw NSError()
            }
            
            print(dataDictionary["update"] as Any)
            updateStatus = (dataDictionary["update"] as! String)
        }
        catch let error{
            print("Json Parse Error : \(error)")
        }
    }
    
    // MARK: Delegate Method
    class tokenModel {
        weak var tokenDelegate: ParseSendDataDelegate?
        func getTokenData() {
            DispatchQueue.main.async {
                print(theToken as Any)
                print(theCounter as Any)
                theCounter += 1
                
                if (theToken != nil) {
                    self.tokenDelegate?.didReceiveTokenData(theToken)
                }
                else{
                    if (theCounter >= theRepeat) {
                        theCounter = 0
                        let aData = "sando"
                        self.tokenDelegate?.didReceiveTokenData(aData)
                    }
                    else if (theCounter < theRepeat) {
                        self.getTokenData()
                    }
                }
            }
        }
    }
    
    class userModel {
        weak var userDelegate: ParseSendDataDelegate?
        func getUserData() {
            DispatchQueue.main.async {
                print(userExist as Any)
                theCounter += 1
                
                //if (userExist == "true") {
                if (userName != nil) {
                    print("user name: \(userName as Any)")
                    self.userDelegate?.didReceiveUserData(userExist)
                }
                else{
                    if (theCounter >= theRepeat) {
                        theCounter = 0
                        let aData = "sando"
                        self.userDelegate?.didReceiveUserData(aData)
                    }
                    else if (theCounter < theRepeat) {
                        self.getUserData()
                    }
                }
            }
        }
    }
    
    class competitionModel {
        weak var competitionDelegate: ParseSendDataDelegate?
        func getCompetitionData() {
            DispatchQueue.main.async {
                print(cDate as Any)
                theCounter += 1
                
                if (cDate != nil) {
                    self.competitionDelegate?.didReceiveCompetitionData(cDate)
                }
                else{
                    if (theCounter >= theRepeat) {
                        theCounter = 0
                        let aData = Constants.updating
                        self.competitionDelegate?.didReceiveCompetitionData(aData)
                    }
                    else if (theCounter < theRepeat) {
                        self.getCompetitionData()
                    }
                }
            }
        }
    }
    
    class resetModel {
        weak var resetDelegate: ParseSendDataDelegate?
        func getResetData() {
            DispatchQueue.main.async {
                print(resetStatus as Any)
                theCounter = theCounter+1
                
                if (resetStatus != nil) {
                    theCounter = 0
                    self.resetDelegate?.didReceiveResetStatusData(resetStatus)
                }
                else{
                    if (theCounter >= theRepeat) {
                        theCounter = 0
                        let aData = Constants.tryAgainWithRightData
                        self.resetDelegate?.didReceiveResetStatusData(aData)
                    }
                    else if (theCounter < theRepeat) {
                        self.getResetData()
                    }
                }
            }
        }
    }
    
    class updateModel {
        weak var updateDelegate: ParseSendDataDelegate?
        func getUpdateData() {
            DispatchQueue.main.async {
                print(updateStatus as Any)
                theCounter = theCounter+1
                
                if (updateStatus != nil) {
                    theCounter = 0
                    let aData = ""
                    print(aData)
                    if (updateStatus == "true"){
                        let aData = Constants.hasSend
                        self.updateDelegate?.didReceiveUpdateStatusData(aData)
                        print(aData)
                    }
                    else{
                        let aData = Constants.tryAgainWithRightData
                        self.updateDelegate?.didReceiveUpdateStatusData(aData)
                        print(aData)
                    }
                }
                else{
                    if (theCounter >= theRepeat) {
                        theCounter = 0
                        let aData = Constants.tryAgainWithRightData
                        self.updateDelegate?.didReceiveUpdateStatusData(aData)
                    }
                    else if (theCounter < theRepeat) {
                        self.getUpdateData()
                    }
                }
            }
        }
    }
}

// Test Question Data Sample
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

