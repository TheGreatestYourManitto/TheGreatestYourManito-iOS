//
//  Date+.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/28/24.
//

import SwiftUI

extension Date {
    func toISO8601String() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return isoFormatter.string(from: self)
    }
}
