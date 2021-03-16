//
//  ViewModel.swift
//  Interview
//
//  Created by lawliet on 2021/3/16.
//

import Foundation

struct ViewModel {
    var model = Model()
    var rows = [3, 1, 11, 9, 7]
    
    mutating func getColor(row: Int) -> Color {
        let rowIndex = row % 5
        let quo = row / 5 // 商數
        let index = quo + rows[rowIndex] // 第N列的第幾行
        
        let colorIndex = index % 12
        if colorIndex >= 0 && colorIndex <= 3 {
            return Color(titleColor: .red)
        } else if colorIndex > 3 && colorIndex <= 7 {
            return Color(titleColor: .green)
        } else {
            return Color(titleColor: .blue)
        }
    }
}
