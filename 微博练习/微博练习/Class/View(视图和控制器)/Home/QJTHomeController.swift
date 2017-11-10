//
//  QJTHomeController.swift
//  微博练习
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit


//定义全局常量,使用private修饰
private let cellID = "cellID"

class QJTHomeController: QJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //懒加载微博数组
    private var statusList = [String]()
    
    override func loadData() {
        print("-------加载数据--------")
        //模拟延时加载数据
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            for i in 0..<20 {
                self.statusList.insert(i.description, at: 0)
            }
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }

    //显示好友
    @objc func showFriend(){
        
        let vc = QJTDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

//设置tableview表格数据源方法
extension QJTHomeController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}


 //设置页面
extension QJTHomeController{
    
    override func setupUI() {
        super.setupUI()
        
        //设置导航栏按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriend))
        
        //注册原型cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    

    
}















