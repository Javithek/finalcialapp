//
//  BudgetViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 11/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {

    private var myTabletView : UITableView?
    private var buttonsHeader : [UIButton]?
    private var viewAnimationIdentifier : UIView?
    private var animationLayout : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initButtonsEvent()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initTableView() -> Void {
        guard view.viewWithTag(12) != nil, let newValue = view.viewWithTag(12) else {
            return
        }
        myTabletView = newValue as? UITableView
        let viewXib = UINib(nibName: "DesignCellsBudget", bundle: Bundle.main)
        myTabletView!.register(viewXib, forCellReuseIdentifier: "cellbudget")
        myTabletView!.delegate = self
        myTabletView!.dataSource = self
    }
    
    private func initButtonsEvent() -> Void {
        guard view.viewWithTag(20) != nil && view.viewWithTag(21) != nil && view.viewWithTag(22) != nil else{
            return
        }
        buttonsHeader = [(view.viewWithTag(20) as? UIButton)!, (view.viewWithTag(21) as? UIButton)!, (view.viewWithTag(22) as? UIButton)!]
        for idx in 0 ..< buttonsHeader!.count{
            buttonsHeader![idx].addTarget(self, action: #selector(animateHeader(sender:)), for: .touchUpInside)
        }
    }
    
    @objc private func animateHeader (sender : UIButton) -> Void {
        
        guard getConstraintIdentifier() != nil, let newValueLayout = getConstraintIdentifier() else {
            return
        }
        animationLayout = newValueLayout
        animationLayout!.constant = sender.frame.origin.x
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }, completion: {
                (completed) in
            self.buttonsHeader!.forEach({
                $0.setTitleColor(UIColor(named: "BlackHelveticTableItem"), for: .normal)
                sender.setTitleColor(UIColor.white, for: .normal)
            })
        })
        
    }
    
    private func getConstraintIdentifier() -> NSLayoutConstraint? {
        guard view.viewWithTag(31) != nil, let newValue = view.viewWithTag(31) else{
            return nil
        }
        viewAnimationIdentifier = newValue
        var aviso : Bool = false
        var newValueLayout : NSLayoutConstraint?
        viewAnimationIdentifier!.constraints.forEach{
            if aviso {
                return
            }
            if $0.identifier != nil {
                if $0.identifier!.elementsEqual("layoutanimation"){
                    //cgFloat = $0.constant
                    newValueLayout = $0
                    aviso = true
                }
            }
        }
        return newValueLayout
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

extension BudgetViewController : UITableViewDelegate{
    
}

extension BudgetViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellbudget", for: indexPath)
        return myTableViewCell
    }
}
