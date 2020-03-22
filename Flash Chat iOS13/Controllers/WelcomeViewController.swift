//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          titleLabel.text = "⚡️FlashChat"//-> Chỉ cần đoạn code này là có tự động animation
//        titleLabel.text = ""
//        let titleInput = "⚡️FlashChat"
//        var index = 0.0
//        for char in titleInput {
//            //hàm này khi ko set index ++ , hay chỉ set 1 hằng số ( ví dụ số 2) thì có nghĩa tất cả cả kí tự sẽ đươc in ra ở giây số 2- Vòng lặp chỉ mang ý nghiã là chữ cái sẽ được thêm vào sau 2 s
//            // vì thế mà ta cần set thời gian xuất hiện các kí tự là khác nhau-> hàm naỳ ko tự động làm điều đó ( về cơ bản đây là 1 ví dụ về For loop)
//            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) {
//                (timer) in self.titleLabel.text?.append(char)
//
//            }
//            index += 1
//        }
        
    }
    
    
}
