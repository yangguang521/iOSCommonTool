//
//  Logger.swift
//  iOSCommonTool
//
//  Created by Joe on 2020/12/4.
//

import UIKit

class Logger: NSObject {
    
    /// 格式化LOG
    /// - Parameters:
    ///   - message: 输出内容
    ///   - file: 所在文件
    ///   - function: 所在方法
    ///   - line: 所在行
    public static func debugLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("Debug-Log: <\(fileName):\(function):Line:\(line)> \n \(message)")
        #endif
    }
    
    /// 格式化LOG
    /// - Parameters:
    ///   - items: 输出内容
    ///   - file: 所在文件
    ///   - method: 所在方法
    ///   - line: 所在行
    public static func debugLogItems(_ items: Any... ,
                                     file: String = #file,
                                     method: String = #function,
                                     line: Int = #line) {
        #if DEBUG
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss.SSS"
        var itemStr = ""
        for item in items {
            if let str = item as? String {
                itemStr += str
            } else {
                itemStr += "\(item)"
            }
        }
        var string = "-------------------------- LOG --------------------------\n"
        string += "[" + formatter.string(from: Date()) + "]"
        string += " <" + (file as NSString).lastPathComponent + ":" + method + "  inLine:\(line)>\n"
        string += itemStr
        print(string)
        #endif
    }
    
    /// 输出标记
    /// - Parameters:
    ///   - file: 所在文件
    ///   - method: 所在方法
    ///   - line: 所在行
    public static func markLog(file: String = #file,
                               method: String = #function,
                               line: Int = #line) {
        debugLogItems("- MARK -", file: file, method: method, line: line)
    }
    
}

