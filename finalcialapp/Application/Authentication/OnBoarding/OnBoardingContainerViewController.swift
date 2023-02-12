//
//  OnBoardingContainerViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {

    private var pageControl : UIPageControl?
    private var signin : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializerPageControl() -> Void{
        if view.viewWithTag(6) != nil{
            self.pageControl = view.viewWithTag(6) as? UIPageControl
        }
    }
    
    
    private func initializerSignIn() -> Void{
        if view.viewWithTag(7) != nil{
            self.signin = view.viewWithTag(7) as? UIButton
        }
        self.signin?.addTarget(self, action: #selector(redirectSignLogin), for: .touchUpInside)
    }

    @objc private func redirectSignLogin (_ action : UIButton) -> Void{
        self.performSegue(withIdentifier: "login", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        initializerPageControl()
        initializerSignIn()
        guard segue.identifier!.elementsEqual("openOnBoarding"), let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        destination.setPageControl(pageControl: self.pageControl!)
        
        guard segue.identifier!.elementsEqual("login") , let _ =
            segue.destination as? SignInViewController else {
            return
        }
    }
    

}
