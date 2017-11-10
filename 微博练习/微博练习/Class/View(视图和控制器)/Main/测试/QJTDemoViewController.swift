//
//  QJTDemoViewController.swift
//  微博练习
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit

class QJTDemoViewController: QJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleStr = "第\(navigationController?.childViewControllers.count ?? 0)个控制器"
        navigationController?.title = titleStr
        navItem.title = titleStr;
        
        
    }

    @objc func nextClick() {
        let vc = QJTDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }

}


extension QJTDemoViewController{
    
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(nextClick))
    }
    
    
}
