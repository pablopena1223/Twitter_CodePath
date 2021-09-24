//
//  LoginViewController.swift
//  Twitter
//
//  Created by Pablo  Pena on 9/22/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //let user stay signed in until logged out instead of authorizing eveyrtime
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        //authorization 
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("couldn't login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
