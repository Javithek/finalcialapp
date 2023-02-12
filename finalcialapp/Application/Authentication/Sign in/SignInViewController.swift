//
//  SignInViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    private var btnActionLogin : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBtnLogin()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initBtnLogin() -> Void {
        
        if view.viewWithTag(9) != nil {
            btnActionLogin = view.viewWithTag(9) as? UIButton
            btnActionLogin!.addTarget(self, action: #selector(actionBtnLogin), for: .touchUpInside)
            //initSegueMain()
        }
        
    }
/*
    private func initSegueMain() -> Void{
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let _ = storyBoard.instantiateViewController(withIdentifier: "Transactions")
    } */
    
    @objc private func actionBtnLogin(_ actionButton : UIButton) -> Void{
        self.performSegue(withIdentifier: "Transactions", sender: self)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier!.elementsEqual("Transactions"), let _ = segue.destination as? ViewController else {
            return
        }
    }
    

}
