//
//  HomeConfigurationModel.swift
//  iOSCommonTool
//
//  Created by Joe on 2021/1/5.
//

import UIKit

class HomeConfigurationModel: NSObject {

    //区类型 默认是我的报销
    var configurationSectionType: HomeSectionType = .myReimbursement
    //区标题
    var titleName: String {
        return configurationSectionType.title
    }
    //配置是否打开 默认打开
    var isOpen: Bool = true
    
}
