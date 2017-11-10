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
        for i in 1..<10 {
            statusList.insert(i.description, at: 0)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        
    }
}


 //设置页面
extension QJTHomeController{
    
    override func setupUI() {
        super.setupUI()
        
        //swift调用oc返回instancetype的方法,判断不出是否可选
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriend))
        
        let navBtn:UIButton = UIButton.cz_textButton("好友", fontSize:16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange )
        navBtn.addTarget(self, action: #selector(showFriend), for: .touchUpInside)
        navItem.leftBarButtonItem = UIBarButtonItem(customView: navBtn)
        
        //这种方式无法高亮显示点击文字
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriend))
    }
    

    
}















