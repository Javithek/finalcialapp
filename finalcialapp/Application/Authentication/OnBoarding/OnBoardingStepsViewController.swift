//
//  OnBoardingStepsControllerViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {

    private var header : UILabel?
    private var contentHeader : UILabel?
    private var image : UIImageView?
    private var item : OnBoardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initReferencesSteps()
        loadContenItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initReferencesSteps() -> Void{
        if view.viewWithTag(1) != nil {
            self.image = view.viewWithTag(1) as? UIImageView
        }
        if view.viewWithTag(2) != nil{
            self.header = view.viewWithTag(2) as? UILabel
        }
        if view.viewWithTag(3) != nil{
            self.contentHeader = view.viewWithTag(3) as? UILabel
        }
    }

    private func loadContenItem() -> Void {
        self.header?.text = self.item?.getTitle()
        self.contentHeader?.text = self.item?.getDescription()
        self.image?.image = UIImage(named: self.item?.getImageUrl() ?? "")
    }
    
    public func setTitle(title : UILabel) -> Void{
        self.header = title
    }
    
    public func setDescription(description : UILabel) -> Void{
        self.contentHeader = description
    }
    
    public func setImage(image : UIImageView) -> Void{
        self.image = image
    }
    
    public func setOnBoardingItem(item : OnBoardingItem) -> Void{
        self.item = item
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
