//
//  Environment.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/12/8.
//

import Foundation

enum Environment: String {
    case dev = "https://www.baidu.com"
    case sit = "https://www.sogo.com"
    case uat = "https://www.myquark.cn"
    case product = "https://www.google.com"
}

/*
 添加拷贝脚本
 
 不添加到Target的原因就是 , 我们要用脚本把Setting.Bundle拷贝到ipa中。选中"Target", 切换到Build Phases, 点击+, 选中New Run Script Phase。

 
 

 添加脚本:
 
 if [ ${CONFIGURATION} = "Debug" ]; then
 cp -r ${PROJECT_DIR}/${PROJECT_NAME}/Setting/Release/Settings.bundle ${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
 fi

 
 if [ ${CONFIGURATION} = "Release" ]; then
 cp -r ${PROJECT_DIR}/${PROJECT_NAME}/Setting/Release/Settings.bundle ${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
 fi
 
 
 作者：mian小爬
 链接：https://www.jianshu.com/p/277be7238c28
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
