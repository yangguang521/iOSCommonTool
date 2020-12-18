//
//  FontViewController.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/12/17.
//

import UIKit

class FontViewController: BaseViewController {

    @IBOutlet weak var pingFangTitleLabel: UILabel!
    @IBOutlet weak var helveticaTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "字体"
        pingFangTitleLabel.font = UIFont.pingFangSCFont(fontStyle: .Regular, fontSize: 18)
        helveticaTitleLabel.font = UIFont.helveticaFont(fontStyle: .Regular, fontSize: 18)
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
