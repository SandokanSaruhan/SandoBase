//
//  ViewController.swift
//
//
//  Created by Sando on 06.06.2020.
//  Copyright © 2020 Sando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var username: String!
    var password: String!
    static let pageData = 66
    var result : String!
    let screenSize: CGRect = UIScreen.main.bounds
    
    let child = SpinnerViewController()
    
    // MARK: Delegate Method
    let model = ParseSendData.tokenModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Info
        print("Login Page")
        print("ViewController Page")
        
        
        
        self.view.insertSubview(Design.bg(), at: 0)
        
        // MARK:  Design Methods
        // print("height: \(screenSize.height))")
        self.designPage()
        
        // MARK: Hide Keyboard
        nameTextField.delegate = self
        passwordTextField.delegate = self
        self.dismissKey()
        
        // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // MARK: Get Defaults
        let defaults = UserDefaults.standard
        if defaults.string(forKey: "UserName") != nil{
            nameTextField.text = (defaults.object(forKey: "UserName") as! String)
            passwordTextField.text = (defaults.object(forKey: "Password") as! String)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // MARK: Internet Connection
        if CheckInternet.Connection(){
            // Connected
        }else{
            // self.Alert(Title: "No connection", Message: "Your Device is not connected with internet")
            self.Alert(Title: Constants.noConnectionTitle, Message: Constants.noConnectionMessage)
        }
    }
    
    // MARK: Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        
        // move the root view up by the distance of keyboard height
        self.view.frame.origin.y = 0 - keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        // move back the root view origin to zero
        self.view.frame.origin.y = 0
    }
    
    // MARK: Alert Methods
    func Alert (Title: String, Message: String){
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.retry, style: UIAlertAction.Style.default, handler: retrybtn))
        self.present(alert, animated: true, completion: nil)
    }
    
    func retrybtn(alert: UIAlertAction!) {
        // MARK: Loader
        self.removeTheSpinnerView()
    }
    
    // MARK: Loader
    func createSpinnerView() {
        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeTheSpinnerView() {
        // remove the spinner view controller
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    // MARK: Design Methods
    func designPage() {
        let first_logoX = (screenSize.width*1/4)
        // let first_logoY = 50
        let first_logoY = (screenSize.width*1/10)
        let first_logoW = (screenSize.width*1/2)
        let first_logoH = ((screenSize.width*1/2)*353/606)
        
        let tod_logo = UIImageView(frame: CGRect(x: first_logoX, y: 50, width: first_logoW, height: (screenSize.width*1/2)*451/613))
        tod_logo.image = UIImage(named: "first-logo-article")
        tod_logo.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(tod_logo)
        
        let logoX = (screenSize.width*1/3)
        let logoY = CGFloat(Int(first_logoY) + Int(first_logoH) + Int(screenSize.height*50/667))
        let logoW = (screenSize.width*1/3)
        let logoH = ((screenSize.width*1/3)*419/373)
        
        let logo = UIImageView(frame: CGRect(x: logoX, y: logoY, width: logoW, height: logoH))
        logo.image = UIImage(named: "logo")
        logo.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(logo)
        
        // let nameTextFieldX = 0
        let nameTextFieldY = CGFloat(Int(logoY) + Int(logoH) + Int(screenSize.height*30/667))
        let nameTextFieldW = screenSize.width
        let nameTextFieldH = 40
        
        nameTextField =  UITextField(frame: CGRect(x: 0, y: nameTextFieldY, width: nameTextFieldW, height: 40))
        nameTextField.backgroundColor = UIColor.clear
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        // nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.font = UIFont(name:Constants.bold_Font, size: 18.0)
        nameTextField.textColor = .gray
        // nameTextField.placeholder = "User"
        nameTextField.placeholder = Constants.name
        nameTextField.attributedPlaceholder = NSAttributedString(string:Constants.name, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        nameTextField.textAlignment = NSTextAlignment.center
        nameTextField.autocorrectionType = UITextAutocorrectionType.no
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.returnKeyType = UIReturnKeyType.done
        self.view.addSubview(nameTextField)
        
        // let passwordTextFieldX = 0
        let passwordTextFieldY = CGFloat(Int(nameTextFieldY) + Int(nameTextFieldH) + Int(screenSize.height*20/667))
        let passwordTextFieldW = screenSize.width
        let passwordTextFieldH = 40
        
        passwordTextField =  UITextField(frame: CGRect(x: 0, y: passwordTextFieldY, width: passwordTextFieldW, height: 40))
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.font = UIFont(name:Constants.bold_Font, size: 18.0)
        passwordTextField.attributedPlaceholder = NSAttributedString(string:Constants.password, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTextField.textAlignment = NSTextAlignment.center
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.isSecureTextEntry.toggle()
        self.view.addSubview(passwordTextField) // Password Hiding
        
        let buttonX = screenSize.width/4
        let buttonY = CGFloat(Int(passwordTextFieldY) + Int(passwordTextFieldH) + Int(screenSize.height*30/667))
        let buttonW = screenSize.width/2
        let buttonH = 40
        let image = UIImage(named: "button")
        
        let button = UIButton(type: .system)
        button.setTitle(Constants.enter, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.init(name: Constants.bold_Font, size:16)
        button.titleLabel!.numberOfLines = 1
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 0 // for Multi line text
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(startAction(_:)), for: .touchUpInside)
        // button.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: 40)
        button.tag = 1
        self.view.addSubview(button)
        
        let passwordForgetX = screenSize.width/4
        let passwordForgetY = CGFloat(Int(buttonY) + Int(buttonH) + Int(screenSize.height*20/667))
        let passwordForgetW = screenSize.width/2
        // let passwordForgetH = 30
        
        let passwordForget = UIButton(type: .system)
        passwordForget.setTitle(Constants.forgetPassword, for: .normal)
        passwordForget.tintColor = .white
        passwordForget.titleLabel?.font = UIFont.init(name: Constants.regular_Font, size:12)
        passwordForget.titleLabel!.numberOfLines = 1
        passwordForget.titleLabel!.adjustsFontSizeToFitWidth = true
        passwordForget.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        passwordForget.titleLabel?.lineBreakMode = .byWordWrapping
        passwordForget.titleLabel?.textAlignment = .left
        passwordForget.titleLabel?.numberOfLines = 0 // for Multi line text
        passwordForget.backgroundColor = .clear
        passwordForget.addTarget(self, action: #selector(startAction(_:)), for: .touchUpInside)
        passwordForget.frame = CGRect(x: passwordForgetX, y: passwordForgetY, width: passwordForgetW, height: 30)
        passwordForget.tag = 2
        self.view.addSubview(passwordForget)
    }
    
    // MARK: Action Methods
    @IBAction func startAction(_ sender: UIButton){
        switch (sender.tag) {
        case 1:
            print("1")
            self.otherPage()
        case 2:
            print("2")
            self.forgetPage()
        default:
            print("Back Page")
        }
    }
    
    func otherPage() {
        // MARK: Internet Connection
        if CheckInternet.Connection(){
            // Connected
            
            // MARK: Post Data Methods
            self.postData()
            
            // MARK: Loader
            self.createSpinnerView()
        }
        else{
            self.Alert(Title: Constants.noConnectionTitle, Message: Constants.noConnectionMessage)
        }
    }
    
    func forgetPage() {
        /*
        // Call Another View Controller
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SeventhViewController") as! SeventhViewController
        self.present(VC, animated: true, completion: nil)
        */
        
        // Call Another View Controller
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        VC.modalPresentationStyle = .overCurrentContext //Sando Screen
        self.present(VC, animated: true, completion: nil)
    }
    
    // MARK: Post Data Methods
    func postData(){
        username = nameTextField.text
        password = passwordTextField.text
        // print("username: \(String(username))")
        // Test
         username = "sando"
         password = "bukalemun66"
        
        // MARK: Set Defaults
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "UserName")
        defaults.set(password, forKey: "Password")
        
        // MARK: Server Login
        PostGetData.PostLoginData(username: username, password: password)
        
        // MARK: Delegate Method - Method 3
        model.tokenDelegate = self
        model.getTokenData()
    }
}

// MARK: Delegate Method
extension ViewController: ParseSendDataDelegate {
    func didReceiveTokenData(_ data: String) {
        print(data)
        // MARK: Parse Data Methods
        // MARK: Parsed Data Login
        if (ParseSendData.theToken != nil) {
            print("token: \(ParseSendData.theToken as Any)")
            
            /*
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            */
            
            /*
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ThirteenthViewController") as! ThirteenthViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
            */
            
            /*
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
             */
            
            // Call Another View Controller
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            VC.modalPresentationStyle = .overCurrentContext //Sando Screen
            self.present(VC, animated: true, completion: nil)
        }
        else{
            self.Alert(Title: Constants.noConnectionTitle, Message: Constants.tryAgainWithRightData)
        }
        // MARK: Loader
        self.removeTheSpinnerView()
    }
    func didReceiveUserData(_ data: String) {
        print(data)
    }
    func didReceiveCompetitionData(_ data: String) {
        print(data)
    }
    func didReceiveResetStatusData(_ data: String) {
        print(data)
    }
    func didReceiveUpdateStatusData(_ data: String) {
        print(data)
    }
}

