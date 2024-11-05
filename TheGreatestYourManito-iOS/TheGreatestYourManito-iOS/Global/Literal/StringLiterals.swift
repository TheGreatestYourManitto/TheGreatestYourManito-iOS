//
//  StringLiterals.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/31/24.
//

import SwiftUI

enum StringLiterals {
    
    enum CreateRoomView_AfterWrite {
        static let noticeWordLabel = "참여자가 다 모이면 확인 버튼을 눌러주세요!"
        static let confirmRoomLabel = "이대로 방을 확정할까요?"
        static let confirmRoomSubLabel = "확정하면 방 수정 및 삭제가 불가능합니다"
        static let removeMemberLabel = "님을 삭제할까요?"
        static let removeMemberSubLabel = "지금 삭제해도 다시 초대할 수 있어요!"
        static let deleteBottomSheetLeftBtnLabel = "아니요"
        static let deleteBottomSheetRightBtnLabel = "삭제"
        static let confirmBottomSheetLeftBtnLabel = "취소"
        static let confirmBottomSheetRightBtnLabel = "확정"
    }
    
    enum JoinRoom_After {
        static let noticeWordLabel = "참여자를 기다리고있어요~"
    }
    
    enum JoinRoom_Before {
        static let titleLabel = "방 입장하기"
        static let subTitleLabel = "두근두근\n나만의 마니또를 만나러 - !"
        static let bottomSheetTitleLabel = "방 참여코드"
        static let bottomSheetSubTitleLabel = "방장에게 받은 참여 코드를 입력해주세요"
        static let bottomSheetPlaceholder = "참여 코드"
    }
    
    enum JoinRoom_Loading {
        static let titleLabel = "방 만드는 중 .."
    }
    
}
