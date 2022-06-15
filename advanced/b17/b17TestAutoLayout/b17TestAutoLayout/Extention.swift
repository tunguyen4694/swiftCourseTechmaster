//
//  ExtentionUIColor.swift
//  b17TestAutoLayout
//
//  Created by Nguyễn Anh Tú on 10/05/2022.
//

import UIKit

extension UIColor {
    class func backgroundColor() -> UIColor {
        return UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1.00)
    }
    
    class func mainColor() -> UIColor {
        return UIColor(red: 0.27, green: 0.69, blue: 0.44, alpha: 1.00)
    }
}

extension UILabel {
  func setTextSpacingBy(value: Double) {
    if let textString = self.text {
      let attributedString = NSMutableAttributedString(string: textString)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}

extension String {
    static func format(strings: [String],
                    boldFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
                    boldColor: UIColor = UIColor.blue,
                    inString string: String,
                    font: UIFont = UIFont.systemFont(ofSize: 14),
                    color: UIColor = UIColor.black) -> NSAttributedString {
        let attributedString =
            NSMutableAttributedString(string: string,
                                    attributes: [
                                        NSAttributedString.Key.font: font,
                                        NSAttributedString.Key.foregroundColor: color])
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: boldColor]
        for bold in strings {
            attributedString.addAttributes(boldFontAttribute, range: (string as NSString).range(of: bold))
        }
        return attributedString
    }
}
