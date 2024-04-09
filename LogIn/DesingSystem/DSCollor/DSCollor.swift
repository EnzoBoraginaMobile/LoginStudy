//
//  DSCollor.swift
//  LogIn
//
//  Created by Enzo Boragina on 26/03/24.
//
import Foundation
import UIKit

public enum Colors: String {

    case textfield = "#363636"
    case background = "#000000"
    case fontGray = "#808080"
    case fontWhite = "#FFFFFF"
    case darkGray = "#1C1C1C"
    case purpleBtn = "#9932CC"
    case coralBtn = "#F08080"
    
}

public extension UIColor {
    static func ds( _ color: Colors) -> UIColor {
        return UIColor(hexString: color.rawValue)
    }
}
