//
//  ColorGenerator.swift
//  Right on target
//
//  Created by Александр Рассохин on 20.01.2022.
//

import UIKit

extension UIColor{
    static var random: UIColor{
        return UIColor(
            red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0
            )
    }
}

class ColorGenerator: ValueGeneratorProtocol{
    func generateValue<T>() -> T {
        return UIColor.random as! T
    }
}
    
func toHEX(color: UIColor) -> String{
    let components = color.cgColor.components
    
    let r = components?[0] ?? 0.0
    let g = components?[1] ?? 0.0
    let b = components?[2] ?? 0.0
    
    let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r*255)), lroundf(Float(g*255)), lroundf(Float(b*255)))
    
    return hexString
}

func colorWithHexString(hexString: String) -> UIColor {
    var colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()

    print(colorString)
    let alpha: CGFloat = 1.0
    let red: CGFloat = colorComponentFrom(colorString: colorString, start: 0, length: 2)
    let green: CGFloat = colorComponentFrom(colorString: colorString, start: 2, length: 2)
    let blue: CGFloat = colorComponentFrom(colorString: colorString, start: 4, length: 2)

    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    return color
}

func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {

    let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
    let endIndex = colorString.index(startIndex, offsetBy: length)
    let subString = colorString[startIndex..<endIndex]
    let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
    var hexComponent: UInt32 = 0

    guard Scanner(string: String(fullHexString)).scanHexInt32(&hexComponent) else {
        return 0
    }
    let hexFloat: CGFloat = CGFloat(hexComponent)
    let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
    print(floatValue)
    return floatValue
}

