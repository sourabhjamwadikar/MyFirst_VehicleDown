//
//  RegisterViewController.swift
//  MyFirstProject
//
//  Created by Mac on 07/01/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
   
         @IBAction func registerButton(_ sender: Any) {
       postAPI()
 }
    override func viewDidLoad() {
        super.viewDidLoad()

        //postAPI()
        
        //self.postAPI()
        
        //registerButton
        
        
        
      //  self.registerButton(<#T##sender: Any##Any#>)
        
    
        
    }
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var mobNoTextField: UITextField!
    
    
    let urlAPI = "http://192.168.43.129:8080/testWebService/users/adduser"
    
    
        func postAPI(){
            
            let url = URL(string: urlAPI)
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.setValue("c400d2a8-8a99-45e7-a62b-3cef2d74ce14", forHTTPHeaderField: "TRN-Api-Key")

            
            //            let dataDict = ["name": "John", "job": "developer"]
            
//
            let dataDict = ["usrUsername" : self.usernameTextField.text , "usrPassword" : self.passwordTextField.text , "usrFirstname" : self.firstNameTextField.text , "usrLastname" : self.lastNameTextField.text , "usrEmailid" : self.emailTextField.text , "usrMobile" : self.mobNoTextField.text]
            
//
//
            let data = try! JSONSerialization.data(withJSONObject: dataDict, options: [])
            //let jsonRequestData = try! JSONEncoder().encode(dataDict)
            
            request.httpBody = data
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                
               
                
                    //                let jdon = JSONEncoder
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                    
                    DispatchQueue.main.async
                        {
                          // self.UIUpdate()
                            let alertView = UIAlertController(title: "Success", message: "Data received", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

                            alertView.addAction(alertAction)
                            self.present(alertView, animated: true, completion: nil)

                    }
                
                
                
                
            }
            
            task.resume()
        
}
        
        
//    func UIUpdate(){
//
//
//        print(dataD)
//    }
    

    
    
    
}

