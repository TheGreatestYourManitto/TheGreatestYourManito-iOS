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
    @Published var roomId: Int = 0
    @Published var joinCode: String = ""
    @Published var dDay: Int = 0
    @Published var isSuccessCreateRoom: Bool = false
    @Published var toastText: String = ""
    @Published var showToast: Bool = false
    
    func updateDateTime(date: Date?, time: Date?) throws {
        guard let date = selectedDate, let time = selectedTime else {
            throw NSError(domain: "Date is nil", code: 4000)
        }
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
    
    func calculateDday(date: Date?) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date()) // 오늘의 날짜를 00:00으로 설정
        let targetDate = calendar.startOfDay(for: date ?? Date()) // 선택된 날짜를 00:00으로 설정
        
        // 날짜 차이를 계산
        dDay = calendar.dateComponents([.day], from: today, to: targetDate).day ?? 0
    }
    
    func createButtonTapped() {
        
        guard roomName.isEmpty == false else {
            toastPost("방 이름을 입력해주세요.")
            return
        }
        
        guard roomName.count <= UserInputPolicy.roomNameMaxLength else {
            toastPost("방 이름은 최대 20자를 넘을 수 없습니다.")
            return
        }
        
        do {
            try updateDateTime(date: selectedDate, time: selectedTime)
        } catch {
            toastPost("종료 날짜, 종료 시간을 지정해주세요.")
            return
        }
        
        postMakeRoom { [weak self] in
            self?.isSuccessCreateRoom = true
        }
    }
    
    private func toastPost(_ message: String) {
        self.toastText = message
        self.showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.toastDelay) { [weak self] in
            self?.showToast = false
        }
    }
}

extension CreateRoomViewModel {
    
    func postMakeRoom(onCompletion: @escaping () -> Void) {
        guard let endDateTime = endDateTime else { return print("endDateTime error")}
        print("roomName: \(roomName), endDateTime: \(endDateTime.toISO8601String()) 전송 API 요청")
        let requestBody = MakeRoomRequestBody(roomName: roomName, endDate: endDateTime.toISO8601String())
        NetworkService.shared.roomService.postMakeRoom(requestBody: requestBody, completion: { result in
            switch result {
            case .success(let response):
                guard let invitationCode = response.result?.invitationCode, let endDate = response.result?.endDate else {return}
                print("Success: \(response)")
                self.joinCode = invitationCode
                self.dDay = Date.calculateDDay(from: endDate) ?? 0
                onCompletion()
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
