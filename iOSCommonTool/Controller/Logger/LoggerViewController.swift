//
//  LoggerViewController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/12/4.
//

import UIKit

class LoggerViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Logger"
        Logger.debugLog("ios14")
        Logger.debugLogItems("iphonexr", "iphone11", "ipnone12", 100, 200, ["1":"2"], ["a", "b", "c"])
        Logger.markLog()
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
