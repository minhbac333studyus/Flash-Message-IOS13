//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let emailIp = emailTextfield.text, let passwordIp = passwordTextfield.text {
            Auth.auth().signIn(withEmail: emailIp, password: passwordIp) { authResult, error in
                //Nếu error ko phải giá trị null,( tức là có lỗi phát sinh ) -> in ra ngoài màn hình
                if let e = error {
                    //Nếu người dùng nhập lỗi ( ví dụ mật khẩu ít kí tự <6 )-> xuất ra báo lỗi
                    print(e)
                    
                } else {
                    //Navigate to ChatView Controller
                    self.performSegue(withIdentifier: SequeName.loginSeque, sender: self)
                }
            }
        }
    }
    
}
