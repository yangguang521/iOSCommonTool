//
//  Util.swift
//  AVCaptureSupport
//
//  Created by Joe on 2020/11/24.
//

import Foundation
import UIKit

// MARK: 是否是暗黑模式
var isDarkMode: Bool {
    if #available(iOS 13.0, *) {
        return UITraitCollection.current.userInterfaceStyle == .dark
    }
    return false
}
