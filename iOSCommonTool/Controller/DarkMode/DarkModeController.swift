//
//  DarkModeController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/11/24.
//

import UIKit

class DarkModeController: BaseViewController {
    
    fileprivate var titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationItem.title = "暗黑模式"
        self.view.backgroundColor = UIColor.matchModeColor(lightModeColor: .white, darkModeColor: .black)
        setUpSubView()
    }
    
    func setUpSubView() {
        titleLabel.text = "当前是否暗黑模式：\(isDarkMode ? "是暗黑模式":"不是暗黑模式")"
        titleLabel.textColor = UIColor.matchModeColor(lightModeColor: UIColor.hexColor(0x333333), darkModeColor: UIColor.white)
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                titleLabel.text = "当前是否暗黑模式：\(isDarkMode ? "是暗黑模式":"不是暗黑模式")"
                print("模式变化了：\n oldTraitCollection:\(String(describing: previousTraitCollection)) \n newTraitCollection:\(self.traitCollection)")
            }
        }
        
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
