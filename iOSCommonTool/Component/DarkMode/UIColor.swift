//
//  UIColor.swift
//  AVCaptureSupport
//
//  Created by Joe on 2020/11/24.
//
import Foundation
import UIKit

extension UIColor {
    
    // MARK: - RGB不带透明度
    public class func rgbColor(r: CGFloat,g: CGFloat,b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1);
    }
    
    // MARK: - RGB带透明度
    public class func rgbaColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a);
    }
    
    // MARK: - 十六进制不带透明度颜色
    public class func hexColor(_ hexValue: Int) -> UIColor {
        return hexAlphaColor(hexValue, alpha: 1.0)
    }
    
    // MARK: - 十六进制带透明度颜色
    public class func hexAlphaColor(_ hexValue: Int, alpha: CGFloat) -> UIColor {
        let red = (CGFloat((hexValue & 0xFF0000) >> 16)) / 255
        let green = (CGFloat((hexValue & 0xFF00) >> 8)) / 255
        let blue = (CGFloat(hexValue & 0xFF)) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // MARK: - 根据模式自动切换颜色
    public class func matchModeColor(lightModeColor: UIColor, darkModeColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            let dynamicColor = UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return darkModeColor
                }else if traitCollection.userInterfaceStyle == .unspecified {
                    return .purple
                }
                return lightModeColor
            }
            return dynamicColor
        }
        return lightModeColor
    }
    
}
