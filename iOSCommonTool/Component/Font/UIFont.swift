//
//  UIFont.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/12/17.
//

import Foundation
import UIKit

extension UIFont {
    /*
     - 0 : "PingFangSC-Regular"
     - 1 : "PingFangSC-Ultralight"
     - 2 : "PingFangSC-Thin"
     - 3 : "PingFangSC-Light"
     - 4 : "PingFangSC-Medium"
     - 5 : "PingFangSC-Semibold"
     */
    
    //MARK: - 苹方体样式 PingFang SC
    enum PingFangSCStyle {
        case Regular
        case Light
        case Medium
        case Semibold
        case Ultralight
        case Thin
        
        var fontName: String {
            switch self {
            case .Regular:
                return "PingFangSC-Regular"
            case .Light:
                return "PingFangSC-Light"
            case .Medium:
                return "PingFangSC-Medium"
            case .Semibold:
                return "PingFangSC-Semibold"
            case .Ultralight:
                return "PingFangSC-Ultralight"
            case .Thin:
                return "PingFangSC-Thin"
            }
        }
    }
    
    //MARK: - 赫维提卡体样式 Helvetica
    enum HelveticaStyle {
        case Regular
        case Bold
        case BoldOblique
        case Light
        case LightOblique
        case Oblique
        
        var fontName: String {
            switch self {
            case .Regular:
                return "Helvetica"
            case .Bold:
                return "Helvetica-Bold"
            case .BoldOblique:
                return "Helvetica-BoldOblique"
            case .Light:
                return "Helvetica-Light"
            case .LightOblique:
                return "Helvetica-LightOblique"
            case .Oblique:
                return "Helvetica-Oblique"
            }
        }
    }
    
    //MARK: - PingFangSC字体
    class func pingFangSCFont(fontStyle: PingFangSCStyle ,fontSize: CGFloat) -> UIFont {
        return UIFont(name: fontStyle.fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    //MARK: - Helvetica字体
    class func helveticaFont(fontStyle: HelveticaStyle ,fontSize: CGFloat) -> UIFont {
        return UIFont(name: fontStyle.fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
}
