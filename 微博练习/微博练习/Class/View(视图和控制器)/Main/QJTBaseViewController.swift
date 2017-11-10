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
    let navtionBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    //自定义导航条目
    let navItem = UINavigationItem()
    //添加tableview-->如果用户不登录,就不创建
    var tableView = UITableView()
    //定义刷新控件
    var refreshControl = UIRefreshControl()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
    
    //加载数据,具体由子类实现
    @objc func loadData()  {
        
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
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavtion()
        setupTableView()
    }
    
    //添加tableview
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        //设置内容缩进
        tableView.contentInset = UIEdgeInsets(top: navtionBar.bounds.height  - 20, left: 0, bottom: 0, right: 0)
        view.insertSubview(tableView, belowSubview: navtionBar) //让tableview在nav下面显示
        
        //设置刷新控件
        //1>初始化
        refreshControl = UIRefreshControl()
        //2>添加到表格
        tableView.addSubview(refreshControl)
        //3>设置触发事件
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    func setupNavtion() {
        //添加导航条
        view.addSubview(navtionBar)
        //将item设置给navbar
        navtionBar.items = [navItem]
        //设置navbar渲染颜色
//        navtionBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navtionBar.backgroundColor = UIColor.orange
        
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













