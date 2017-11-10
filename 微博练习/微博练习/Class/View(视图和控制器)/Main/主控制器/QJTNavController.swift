//
//  QJTNavController.swift
//  微博练习
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit

class QJTNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true;
    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            //判断控制器类型
            if let vc = viewController as? QJTBaseViewController{
                
                var title = "返回"
                //判断控制器级数
                if childViewControllers.count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack:true)
            }
            
        }
        super .pushViewController(viewController, animated: animated)
    }
    
    //返回上一级控制器
    @objc func popToParent() {
        popViewController(animated: true)
    }
}
