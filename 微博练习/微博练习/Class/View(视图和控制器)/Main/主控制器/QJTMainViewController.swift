//
//  QJTMainViewController.swift
//  微博练习
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 秦江涛. All rights reserved.
//

import UIKit

class QJTMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        setupChildControllers()
        setComposeBtn()
        
    }
    
    //设置屏幕的横竖屏,设置后当前控制器和子控制器都会遵循这个方法
    //播放视频,一般都是通过modal出来的
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait //.landscape
    }
    
    //撰写按钮点击方法
    //private 保证方法私有,仅在当前对象被访问
    //objc  允许这个函数在运行时通过oc消息机制被访问
    @objc private func composeBtnClick() {
        print("点击了按钮")
        
        //测试方向的旋转
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cz_random()
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true, completion: nil)
        
    }
    
    //撰写加号按钮
    private lazy var composeBtn :UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add_highlighted", backgroundImageName: "tabbar_compose_button")
    
}

//extension类似于oc中的分类,在swift中还可以用来切分代码块
// MARK: - 设置页面
extension QJTMainViewController{
    
    ///设置撰写按钮
    private func setComposeBtn(){
        tabBar.addSubview(composeBtn)
        
        //计算按钮宽度
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1     //-1是为了处理容错点问题
        
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
    }
    
    /// 设置字控制器
    private func setupChildControllers() {
        
        let array = [
            ["className":"QJTHomeController","title":"首页","imageName":"home"],
            ["className":"QJTMessageController","title":"消息","imageName":"message_center"],
            ["className":"UITabBarController"],
            ["className":"QJTDiscoverController","title":"搜索","imageName":"discover"],
            ["className":"QJTProfileController","title":"个人中心","imageName":"profile"]
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[title,imageName,className]
    /// - Returns: 子控制器
    private func controller(dict:[String:String]) -> UIViewController {
        
        
        //取得字典内容
        guard let className = dict["className"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + className) as? UIViewController.Type
        else {
            return UIViewController()
        }

        //创建视图控制器
        let vc = cls.init()
        vc.title = title
        //设置图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        //设置tabbar字体颜色
//        vc.tabBarItem.setTitleTextAttributes( [NSForegroundColorAttributeName: UIColor.orange()], for: .highlighted)
        

        let nav = QJTNavController(rootViewController: vc)
        return nav

        
    }
    
}

















