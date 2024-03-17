//
//  String + isAbsoluteEmpty.swift
//  Notes
//
//  Created by Артемий Дериглазов on 17.03.2024.
//

extension String {
    ///Returns a Boolean value indicating whether the String is empty after trimming any leading or trailing whitespaces and newlines.
    var isAbsoluteEmpty: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
