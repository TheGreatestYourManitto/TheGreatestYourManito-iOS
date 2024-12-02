//
//  CreateRoomViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/28/24.
//

import SwiftUI

final class CreateRoomViewModel: ObservableObject {
    @Published var roomName: String = ""
    @Published var selectedDate: Date? = nil
    @Published var selectedTime: Date? = nil
    @Published var endDateTime: Date? = nil
    
    func updateDateTime() {
        guard let date = selectedDate, let time = selectedTime else { return }
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: time)
        var combinedComponents = DateComponents()
        combinedComponents.year = dateComponents.year
        combinedComponents.month = dateComponents.month
        combinedComponents.day = dateComponents.day
        combinedComponents.hour = timeComponents.hour
        combinedComponents.minute = timeComponents.minute

        endDateTime = calendar.date(from: combinedComponents)
    }
}

extension CreateRoomViewModel {
    
    func postMakeRoom() {
        updateDateTime()
        guard let endDateTime = endDateTime else { return print("endDateTime error")}
        print("roomName: \(roomName), endDateTime: \(endDateTime.toISO8601String()) 전송 API 요청")
        let requestBody = MakeRoomRequestBody(roomName: roomName, endDate: endDateTime.toISO8601String())
        NetworkService.shared.roomService.postMakeRoom(requestBody: requestBody, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
