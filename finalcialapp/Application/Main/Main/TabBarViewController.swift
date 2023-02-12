//
//  TabBarViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 11/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var addButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAddButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initAddButton() -> Void {
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        var frameAddButton = addButton!.frame
        frameAddButton.origin.y = ((view.frame.height - (addButton!.frame.height * 2)) + (addButton!.frame.height / 3))
        frameAddButton.origin.x = view.frame.width - (addButton!.frame.width * 2)
        addButton!.frame = frameAddButton
        addButton!.setImage(UIImage(named: "TabBarAddIcon"), for: .normal)
        addButton!.backgroundColor = UIColor(named: "ButtonColorGreen")
        addButton!.layer.cornerRadius = 10
        view.addSubview(addButton!)
        addButton!.addTarget(self, action: #selector(actionAddButton(sender:)), for: .touchUpInside)
    }
    
    @objc private func actionAddButton(sender : UIButton) -> Void {
        selectedIndex = 4
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
