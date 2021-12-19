//
//  LoginViewController.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import UIKit

class LoginViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }

    @IBAction func LoginButton(_ sender: Any) {
        
        rootVM?.viewActive =  .Home
    }
    
    
    @IBAction func RegistrButton(_ sender: Any) {
        rootVM?.viewActive = .Register
    }
    
   

}
