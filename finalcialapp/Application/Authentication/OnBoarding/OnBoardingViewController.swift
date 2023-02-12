//
//  OnBoardingViewController.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIPageViewController {

    private var pageControl : UIPageControl?
    
    fileprivate(set) lazy var items : [OnBoardingItem] = {
        return [
            OnBoardingItem(title: "Save money and reduce debt", description: "Press the start button", imageUrl: "OnBoardingOne"),
            OnBoardingItem(title: "You've finished you onBoarding", description: "Press the start button", imageUrl: "OnBoardingTwo")
        ]
    }()
    
    fileprivate(set) lazy var contentViewController : [UIViewController] = {
        var item = [UIViewController]()
        for idx in 0 ..< self.items.count{
            item.append(self.instanceViewController(idx))
        }
        return item
    }()
    
    private func instanceViewController(_ idx : Int) -> UIViewController{
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            return UIViewController()
        }
        viewController.setOnBoardingItem(item: self.items[idx])
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        self.pageControl?.numberOfPages = items.count
        updateContainerView(idx: self.pageControl?.currentPage ?? 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateContainerView (idx : Int) -> Void{
        setViewControllers([contentViewController[idx]], direction: .forward, animated: true, completion: nil)
    }
    
    public func setPageControl(pageControl : UIPageControl) -> Void{
        self.pageControl = pageControl
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

extension OnBoardingViewController : UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let idx = contentViewController.index(of : viewController)
        if idx == 0 {
            return nil
        }
        return contentViewController[idx! + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let idx = contentViewController.index(of : viewController)
        if idx == contentViewController.count - 1{
            return nil
        }
        return contentViewController[idx! + 1]
    }
    
    
}

extension OnBoardingViewController : UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let idx = contentViewController.index(of : viewControllers!.first!) else {
            return
        }
        self.pageControl?.currentPage = idx
    }
    
}
