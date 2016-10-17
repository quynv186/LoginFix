//
//  ViewController.swift
//  Login
//
//  Created by admin on 10/17/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_User: UITextField!
    @IBOutlet weak var tf_Password: UITextField!
    @IBOutlet weak var lbl_Result: UILabel!
    @IBOutlet weak var lbl_Print: UILabel!
    
    var users = ["an":"123","binh":"456","hanh":"789"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor: UIColor = UIColor.white
        tf_User.layer.borderColor = myColor.cgColor
        tf_Password.layer.borderColor = myColor.cgColor
        tf_User.layer.borderWidth = 1.0
        tf_Password.layer.borderWidth = 1.0
        
        self.tf_User.layer.cornerRadius = CGFloat(Float(6))
        self.tf_Password.layer.cornerRadius = CGFloat(Float(6))
    }


    @IBAction func action_Login(_ sender: UIButton) {
        if let password = users[tf_User.text!] {
            if password == tf_Password.text {
                lbl_Result.text = "Dang nhap thanh cong"
            } else {
                lbl_Result.text = "Mat khau khong dung"
            }
        } else {
            lbl_Result.text = "Khong co user nay"
        }
    }
    
    @IBAction func action_List(_ sender: AnyObject) {
        var list: String = ""
        for user in users {
            list = list + "userName: \(user.0)" + " - Password: \(user.1)\n"
        }
        lbl_Print.text = list
    }

    @IBAction func action_Add(_ sender: UIButton) {
        if users[tf_User.text!] != nil {
            lbl_Result.text = "Da co user nay"
        } else {
            lbl_Result.text = "Add user thanh cong"
            if (tf_Password.text != "") {
                users[tf_User.text!] = tf_Password.text
            } else {
                lbl_Result.text = "Ban hay nhap mat khau"
            }
        }
    }
    
    @IBAction func action_Edit(_ sender: UIButton) {
        if (users[tf_User.text!] != nil) {
            lbl_Result.text = "User update"
            users[tf_User.text!] = tf_Password.text
        } else {
            lbl_Result.text = "Chua co user"
        }
    }
    
    @IBAction func action_Delete(_ sender: UIButton) {
        if (users[tf_User.text!] != nil) {
            users.removeValue(forKey: tf_User.text!)
            lbl_Result.text = "Xoa thanh cong"
        } else {
            lbl_Result.text = "User chua co khong xoa dc"
        }
    }
    
}

