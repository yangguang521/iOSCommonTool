//
//  BaseViewController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/11/24.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setUpUI()
    }
    
    func setUpUI() {
        //导航栏背景颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.matchModeColor(lightModeColor: .white, darkModeColor: .black)
        self.navigationController?.navigationBar.isTranslucent = false
        //导航栏标题颜色和大小
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.matchModeColor(lightModeColor: .black, darkModeColor: .white), .font:UIFont.systemFont(ofSize: 18)]
        
        
        /*
        //appearance
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.matchModeColor(lightModeColor: .green, darkModeColor: .blue)
        UINavigationBar.appearance().barTintColor = UIColor.matchModeColor(lightModeColor: .green, darkModeColor: .blue)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor.matchModeColor(lightModeColor: .black, darkModeColor: .white), .font:UIFont.systemFont(ofSize: 18)]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        */

        /*
        [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
        */
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
