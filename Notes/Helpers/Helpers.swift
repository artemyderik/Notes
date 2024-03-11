//
//  Helpers.swift
//  Notes
//
//  Created by Артемий Дериглазов on 10.03.2024.
//

import Foundation

func toFormatDate(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM Y 'at' HH:mm"
    return formatter.string(from: date)
}
