//
//  Constants.swift
//  
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    // MARK: string
    static let password = "Şifre"
    static let name = "Kullanıcı Adı"
    static let email = "E-mail"
    // static let enter = "GİRİŞ"
    static let enter = NSLocalizedString("Enter", comment: "")
    static let forgetPassword = "Şifremi Unuttum"
    static let faq = "SIKÇA SORULAN SORULAR"
    static let legal = "YASAL BİLGİLENDİRME"
    static let profile = "PROFİLİM"
    static let timeAlert = "GELECEK YARIŞMAYA KALAN SÜRE"
    static let send = "GÖNDER"
    static let hasSend = "GÖNDERİLDİ"
    static let noConnectionTitle = "Bağlantı Sorunu"
    static let noConnectionMessage = "Bağlantı Sorunu"
    static let tryAgainWithRightData = "Sever, Bağlantı ve Kullanıcı Bilgilerini Kontrol Edip Tekrar Deneyin"
    static let updating = "Güncelleniyor"
    static let noData = "..."
    static let point = "Puan"
    static let questionPoint = "Soru Puanı"
    static let secondsLeft = "Saniye Kaldı"
    static let noSecondsLeft = "Süre Bitti"
    static let goToCompetition = "Yarışmaya Git"
    static let competition = "Yarışma"
    static let endOfCompetition = "Yarışma Bitti"
    static let save = "KAYDET"
    static let retry = "Tekrar Dene"
    
    // MARK: font
    static let digital_Font = "digital-7"
    static let regular_Font = "Montserrat-Regular"
    static let bold_Font = "Montserrat-Bold"
    
    // MARK: url
    static let API_BASE_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_LOGIN_URL = "http://sando.com/viewer/Project_Auditor/login.php"
    static let API_DEVICE_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_COMPETITION_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_COMPETITION_URL_TEST = "http://sando.com/viewer/Project_Auditor/"
    static let API_QUESTIONS_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_END_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_USER_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_USER_RESET_URL = "http://sando.com/viewer/Project_Auditor/"
    static let API_USER_UPDATE_URL = "http://sando.com/viewer/Project_Auditor/"
    
    // MARK: color
    static let VIEW_BORDER_COLOR : UIColor = UIColor(red: 22/255, green: 185/255, blue: 190/255, alpha: 1.0) /* #16b9be */
    
    /*
    UIColor(hue: 0.5028, saturation: 0.88, brightness: 0.74, alpha: 1.0) /* #16b9be */
    UIColor(hue: 181/360, saturation: 88/100, brightness: 74/100, alpha: 1.0) /* #16b9be */
    UIColor(red: 0.0863, green: 0.7255, blue: 0.7451, alpha: 1.0) /* #16b9be */
    */
    
    static let VIEW_BG_COLOR : UIColor = UIColor(red: 250/255, green: 245/255, blue: 245/255, alpha: 1.0) /* #faf5f5 */
}

