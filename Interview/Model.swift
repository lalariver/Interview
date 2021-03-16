//
//  Model.swift
//  Interview
//
//  Created by lawliet on 2021/3/16.
//

import Foundation
import UIKit

struct Model {
    var colors = [Color(titleColor: .red),
                  Color(titleColor: .red),
                  Color(titleColor: .blue),
                  Color(titleColor: .blue),
                  Color(titleColor: .green)]
}

struct Color {
    var titleColor: UIColor
    var backgroundColor: UIColor {
        if titleColor == UIColor.red {
            return UIColor(red: 255/255, green: 204/255, blue: 255/255, alpha: 1.0)
        } else if titleColor == UIColor.green {
            return UIColor(red: 204/255, green: 255/255, blue: 204/255, alpha: 1.0)
        } else {
            return UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1.0)
        }
    }
    var selectColor: UIColor {
        if titleColor == UIColor.red {
            return UIColor.red
        } else if titleColor == UIColor.green {
            return UIColor.green
        } else {
            return UIColor.blue
        }
    }
}
