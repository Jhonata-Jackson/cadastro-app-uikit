//
//  RegisterViewControlerStyles.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 06/07/23.
//

import Foundation
import UIKit

struct Style {
    struct Color {
        static let title = UIColor.black
        static let subTitle = UIColor.darkGray
    }
    
    struct Font {
        static let title = UIFont.systemFont(ofSize: 30)
        static let subTitle = UIFont.systemFont(ofSize: 20)
    }
}

struct FontColorStyle {
    let font: UIFont?
    let color: UIColor?
    
    static let title = FontColorStyle(font: Style.Font.title, color: Style.Color.title)
    static let subTitle = FontColorStyle(font: Style.Font.subTitle, color: Style.Color.subTitle)
    
    func apply(_ component: UILabel) {
        component.font = font
        component.textColor = color
    }
}

extension UILabel {
    func applyStyle(_ fontColorStyle: FontColorStyle) {
        fontColorStyle.apply(self)
    }
}
