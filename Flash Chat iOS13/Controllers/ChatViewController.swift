//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()  //database
    
    var messageArray: [Message] = [// set message là 1 araray có các phần tử là các câu chat của sender
//        Message(senderOnDB: "user1@gmail.com", bodyOnDB: "Hey! This is message from user1"),
//        Message(senderOnDB: "user2@gmail.com", bodyOnDB: "Hey! This is message from user2"),
//        Message(senderOnDB: "user2@gmail.com", bodyOnDB: "xzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzcxzc")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //look to chatViewCOntroller -> trigger UIViewDataSource to get info
        //        getsiter the nib?
        tableView.register(UINib(nibName: SequeName.cellNibName , bundle: nil), forCellReuseIdentifier: SequeName.cellIdentifier)
        loadMessage()
        
    }
    func loadMessage() {
        
        db.collection(SequeName.FStore.collectionName)
            .order(by: SequeName.FStore.dateField)
            .addSnapshotListener{ (QuerySnapshot,error ) in
            self.messageArray = []
            if let e = error {
                print("theere awas a isuue reteieving data from FireStore. \(e)")
            } else {
                if let snapshotDocument = QuerySnapshot?.documents{
                    for doc in snapshotDocument{
                        let data = (doc.data())
                        if let MessageSender = data[SequeName.FStore.senderField] as? String,
                            let MessageBody = data[SequeName.FStore.bodyField] as? String //DownCast to String
                        {
                            let newMessage = Message(senderOnDB: MessageSender, bodyOnDB: MessageBody)
                            self.messageArray.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //Update Table view when we sent the messsage
                                let indexScrollTo_UpdateMessage_LastLine = IndexPath(row: self.messageArray.count - 1 , section: 0)
                                self.tableView.scrollToRow(at: indexScrollTo_UpdateMessage_LastLine, at: .top, animated: true)
                               
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
        @IBAction func sendPressed(_ sender: UIButton) {
            if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
                db.collection(SequeName.FStore.collectionName).addDocument(data: [SequeName.FStore.senderField: messageSender,
                                                                                  SequeName.FStore.bodyField: messageBody,
                                                                                  SequeName.FStore.dateField: Date().timeIntervalSince1970])
                { (error) in
                    if let e = error {
                        print("there was a issue saving data to firestire, \(e)")
                    } else {
                        print("Successfully save data.")
                        DispatchQueue.main.async {
                             self.messageTextfield.text = ""
                        }
                       
                    }
                }
            }
        }
        
        
    }
    extension ChatViewController: UITableViewDataSource {
        //How many cell-row in your table view ?
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //3 message-> may return 3
            return messageArray.count
            //Hàm này trả về số lần mà message có tin nhắn (Indexpath.row -> chính là số này ) - Số hàng tin nhắn đã gửi
        }
        //Hàm này chạy lặp count lần tương ứng với số tin nhắn đã lưu
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let message = messageArray[ indexPath.row ]
            let cell = tableView.dequeueReusableCell(withIdentifier: SequeName.cellIdentifier, for: indexPath) as! MessageSentCell
            cell.messageContent.text = message.bodyOnDB
            if message.senderOnDB == Auth.auth().currentUser?.email{
                cell.leftImageView.isHidden = true
                cell.rightImageView.isHidden = false
                cell.messageBoder.backgroundColor = UIColor(named: SequeName.BrandColors.lightPurple)
                cell.messageContent.textColor = UIColor(named: SequeName.BrandColors.purple)
                
            } else {
                cell.leftImageView.isHidden = false
                cell.rightImageView.isHidden = true
                cell.messageBoder.backgroundColor = UIColor(named: SequeName.BrandColors.purple)
                cell.messageContent.textColor = UIColor(named: SequeName.BrandColors.lightPurple)
            }
            
            return cell
        }
        
        
}

