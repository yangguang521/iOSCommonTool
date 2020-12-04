//
//  ViewController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/11/24.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let titlesArray = ["暗黑模式", "Logger输出", "文件系统", "指纹面容识别",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        setUpSubviews()
    }
    
    func setUpSubviews() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)")!
        cell.textLabel?.text = titlesArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.matchModeColor(lightModeColor: UIColor.hexColor(0x333333), darkModeColor: .white)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var controller: UIViewController? = nil
        
        switch indexPath.row {
        case 0:
            controller = DarkModeController()
        case 1:
            controller = LoggerViewController()
        case 2:
            controller = FileManagerController()
        default:
            controller = nil
        }
        
        guard let vc = controller else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
