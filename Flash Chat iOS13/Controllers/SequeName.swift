//
//  SequeName.swift
//  Flash Chat iOS13
//
//  Created by Adam  on 3/18/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
struct SequeName {
    static let title = "⚡️FlashChat"
    static let loginSeque = "LoginToChat"
    static let registerSeque = "RegisterToChat"
    //Dùng biên static thì có thể truy cập thẳng vào biến ở trong 1 struct mà ko cần khởi taọ 1 object để truy câp
    //Chỉ là shortcut
    //tương tự với function - íntance method ( mì ăn liền)
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageSentCell"
//    static let registerSegue = "RegisterToChat"
//    static let loginSegue = "LoginToChat"
//
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messagesNameOnDB"
        static let senderField = "senderNameSavedOnDataBase"
        static let bodyField = "bodyMessageSavedOnDataBase"
        static let dateField = "date"
    }
}
