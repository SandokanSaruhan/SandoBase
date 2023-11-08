//
//  PostGetData.swift
//  
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation

class PostGetData{
    
    static var endCompetition: String!
    static var getToken: String!
    
    // MARK: POST Methods
    // MARK: Service Login
    class func PostLoginData(username:String, password:String) {
        // print(username)
        // print(password)
        
        let url = URL(string: Constants.API_LOGIN_URL)!
        var request = URLRequest (url:url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        request.httpMethod = "POST"
        let postString = "grant_type=password&username="+username+"&password="+password
        // let postString = "grant_type=password&username=sando&password=123456"
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                print("data: \(dataString)")
                                
                                // MARK: Parsed Data Login
                                getToken = ParseSendData.loginDataParse(data: data)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service Device Information
    class func PostiOSDeviceData(token:String, device:String){
        print(device)
        print(token)
        
        let url = URL(string: Constants.API_DEVICE_URL)!
        var request = URLRequest (url:url)
        //request.setValue("application/x-www-form-urlencoded&Bearer "+token, forHTTPHeaderField:"Content-Type&Authorization")
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "POST"
        let postString = "gcm_id="+device
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                print("data: \(data)")
                                print("data: \(dataString)")
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: GET Methods
    // MARK: Service Get User Information
    class func GetUserData(token:String, user:String){
        // print(token)
        print(user)
        
        let url = URL(string: Constants.API_USER_URL+"?username="+user)!
        var request = URLRequest (url:url)
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                print("data: \(dataString)")
                                
                                // MARK: Parsed Data User Information
                                ParseSendData.getUserDataParse(data: data)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service Competition
    class func GetCompetitionData(token:String){
        // print(token)
        
        let url = URL(string: Constants.API_COMPETITION_URL)!
        // let url = URL(string: Constants.API_COMPETITION_URL_TEST)! // Test - Close this
        
        var request = URLRequest (url:url)
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                print("data: \(dataString)")
                                
                                // MARK: Parsed Data For Competiton
                                ParseSendData.getCompetitionDataParse(data: data)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service Questions
    class func GetQuestionsData(token:String, cid:String){
        // print(token)
        // print(cid)
        
        let url = URL(string: Constants.API_QUESTIONS_URL+"?id="+cid)! 
        var request = URLRequest (url:url)
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                                print("data: \(dataString)")
                                
                                // MARK: Parsed Data Questions
                                ParseSendData.questionsDataParse(data: data)
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service End Competition
    class func GetEndData(token:String, cid:String, point:String){
        // print(token)
        // print(cid)
        // print(point)
        
        let url = URL(string: Constants.API_END_URL+"?cid="+cid+"&point="+point)!
        var request = URLRequest (url:url)
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if response.statusCode == 200{
                            do {
                                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                                // print(jsonResponse)
                                
                                guard let dataDictionary = jsonResponse as? Dictionary<String, AnyObject> else {
                                    throw NSError()
                                }
                                print("end competition result: \(String(describing: dataDictionary["result"]))")
                                endCompetition = (dataDictionary["result"] as! String)
                            }
                            catch let error{
                                print("Json Parse Error : \(error)")
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service User Reset
    class func GetUserResetData(user:String, email:String){
        print(user)
        print(email)
        
        let url = URL(string: Constants.API_USER_RESET_URL+"?username="+user+"&email="+email)!
        var request = URLRequest (url:url)
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("data: \(dataString)")
                            
                            // MARK: Parsed Data For Reset
                            ParseSendData.getResetDataParse(data: data)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: Service User Update
    class func GetUserUpdateData(user:String, email:String, token:String){
        print(user)
        print(email)
        print(token)
        
        let url = URL(string: Constants.API_USER_UPDATE_URL+"?username="+user+"&email="+email)!
        var request = URLRequest (url:url)
        request.setValue("Bearer "+token, forHTTPHeaderField:"Authorization")
        request.httpMethod = "GET"
        let postString = ""
        request.httpBody = postString.data(using: .utf8)
        
        DispatchQueue.main.async {
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                
                if let error = error {
                    print("error: \(error)")
                }
                else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("data: \(dataString)")
                            
                            // MARK: Parsed Data For Reset
                            ParseSendData.getUpdateDataParse(data: data)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

