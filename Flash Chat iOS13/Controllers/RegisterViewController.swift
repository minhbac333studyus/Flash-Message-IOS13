//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        //Hàm if let có nghĩa là nếu email nhập vào ko phải là Null value thì tiếp tục xử lý
        //Đây là bước bắt buộc để xác nhận email người dùng nhập vào và lưu vào bộ cloud dữ liệu của google
        if let emailIp = emailTextfield.text, let passwordIp = passwordTextfield.text {
            Auth.auth().createUser(withEmail: emailIp, password: passwordIp) { authResult, error in
                //Nếu error ko phải giá trị null,( tức là có lỗi phát sinh ) -> in ra ngoài màn hình
                if let e = error {
                    //Nếu người dùng nhập lỗi ( ví dụ mật khẩu ít kí tự <6 )-> xuất ra báo lỗi
                    print(e.localizedDescription)
                    
                } else {
                    //Navigate to ChatView Controller
                    self.performSegue(withIdentifier: SequeName.registerSeque, sender: self)
                }
            }
        }
    }
}
