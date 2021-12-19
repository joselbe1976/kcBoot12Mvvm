//
//  LoginViewController.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var rootVM:RootViewModel?
    

    init(vm:RootViewModel){
        super.init(nibName: nil, bundle: nil)
        self.rootVM = vm
        
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Binding
        self.rootVM?.errorMessage.bind({ data in
            self.errorLabel.text = data
        })
    }

    @IBAction func LoginButton(_ sender: Any) {
        self.errorLabel.text = "Login...." //lo hago en la view o en el viewmodel...
        
        //desempaquetamos
        if let user = user.text,
           let passowrd = password.text {
            self.rootVM?.login(user: user, pass: passowrd)
        }
    }
    
    
    @IBAction func RegistrButton(_ sender: Any) {
        rootVM?.viewActive = .Register
    }
    
   

}
