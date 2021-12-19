//
//  RegisterViewController.swift
//  test1
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 18/12/21.
//

import UIKit

class RegisterViewController: UIViewController {

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

    @IBAction func LogiNButton(_ sender: Any) {
        self.rootVM?.viewActive = .Login
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
