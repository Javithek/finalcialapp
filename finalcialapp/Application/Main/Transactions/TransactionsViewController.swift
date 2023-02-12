//
//  TransactionsViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 11/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    private var tableView : UITableView?
    
    fileprivate(set) lazy var emptyStateView : UIView = {
       
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initTableView() -> Void {
        guard view.viewWithTag(11) != nil, let newTableView = view.viewWithTag(11) as? UITableView else {
            return
        }
        tableView = newTableView
        tableView!.delegate = self
        tableView!.dataSource = self
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

extension TransactionsViewController : UITableViewDelegate{
    
}

extension TransactionsViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        let countItemCell = 10
        if countItemCell == 0{
            tableView.backgroundView = emptyStateView
            tableView.separatorStyle = .none
        }else{
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
        }
        return countItemCell
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
}
