//
//  QJTBaseViewController.swift
//  微博练习
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit


//OC中不支持多继承,可以用协议代替
//extension中不能有属性,不能重写父类方法
class QJTBaseViewController: UIViewController {
    
    //自定义导航条
    let navtionBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64 + 20))
    //自定义导航条目
    let navItem = UINavigationItem()
    
    //添加tableview
    var tableView = UITableView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
    
    //加载数据,具体由子类实现
    func loadData()  {
        
    }
    
    //重写title的didset
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
}

extension QJTBaseViewController{
    
    @objc func setupUI(){
        
        view.backgroundColor = UIColor.cz_random()
        
        setupNavtion()
        setupTableView()
    }
    
    //添加tableview
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
//        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        view.insertSubview(tableView, belowSubview: navtionBar) //让tableview在nav下面显示
    }
    
    func setupNavtion() {
        //添加导航条
        view.addSubview(navtionBar)
        //将item设置给navbar
        navtionBar.items = [navItem]
        //设置navbar渲染颜色
        navtionBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
    }
    
}

extension QJTBaseViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //基类只是准备方法,子类负责实现,子类的数据源方法不需要supper
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}













