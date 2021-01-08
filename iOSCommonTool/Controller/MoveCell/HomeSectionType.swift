//
//  HomeSectionType.swift
//  iOSCommonTool
//
//  Created by Joe on 2021/1/5.
//

import UIKit

enum HomeSectionType {
    case myReimbursement
    case myLoanMoney
    case myDocuments
    case waitMyApproval
    case reportForm
    
    var title: String {
        switch self {
        case .myReimbursement:
            return "我的报销"
        case .myLoanMoney:
            return "我的借款"
        case .myDocuments:
            return "我的单据"
        case .waitMyApproval:
            return "待我审批"
        case .reportForm:
            return "报表"
        }
    }
    
    //配置是否打开 默认打开
    //var isOpen: Bool = true
    
}


/*
 class HomeSectionType: NSObject {
 
 }
 */
