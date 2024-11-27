//
//  StringLiterals.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/31/24.
//

import SwiftUI

enum StringLiterals {
    
    enum AfterJoinRoom {
        static let ownerNoticeWordLabel = "참여자가 다 모이면 확인 버튼을 눌러주세요!"
        static let notOwnerNoticeWordLabel = "참여자를 기다리고있어요~"
        static let confirmRoomLabel = "이대로 방을 확정할까요?"
        static let confirmRoomSubLabel = "확정하면 방 수정 및 삭제가 불가능합니다"
        static let removeMemberLabel = "님을 삭제할까요?"
        static let removeMemberSubLabel = "지금 삭제해도 다시 초대할 수 있어요!"
        static let deleteBottomSheetLeftBtnLabel = "아니요"
        static let deleteBottomSheetRightBtnLabel = "삭제"
        static let confirmBottomSheetLeftBtnLabel = "취소"
        static let confirmBottomSheetRightBtnLabel = "확정"
    }
    
    enum BeforeJoinRoom {
        static let titleLabel = "방 입장하기"
        static let subTitleLabel1 = "두근두근"
        static let subTitleLabel2 = "나만의 마니또를 만나러 - !"
        static let bottomSheetTitleLabel = "방 참여코드"
        static let bottomSheetSubTitleLabel = "방장에게 받은 참여 코드를 입력해주세요"
        static let bottomSheetPlaceholder = "참여 코드"
    }
    
    enum CreateRoom {
        static let titleLabel = "방 만들기"
        static let subTitleLabel1 = "두근두근"
        static let subTitleLabel2 = "나만의 마니또를 만나러 - !"
        static let RoomNameTitleLabel = "방 이름"
        static let RoomNameSubTitleLabel = "최대 10자"
        static let RoomNamePlaceholder = "방 이름을 입력해주세요"
        static let EndDateTitleLabel = "종료일"
        static let EndDateSubTitleLabel = "최대 99일"
        static let EndDatePlaceholder = "종료 날짜"
        static let EndTimePlaceholder = "종료 시간"
    }
    enum JoinRoomPublic {
        static let copyComent = "코드 복사 완료!"
    }
    
    enum OpenManito {
        static let notOpenTitleLabel1 = "내가 N일동안 응원보낼"
        static let notOpenTitleLabel2 = "마니또는 누구일까요?"
        static let openTitleLabel = "나의 마니또는"
        static let notOpenButtonStr = "내 마니또 보기"
        static let openButtonStr = "바로 응원 보내기"
    }

    enum PlayManitto {
        static let headerTopDescriptionLabel = "나의 마니또"
        static let headerTopDescriptionLabelAfterNameStr = "에게"
        static let bottomSheetTextFieldPlaceholder = "응원메세지 입력"
        static let bottomSheetSendButtonStr = "보내기"
        static let bottomSheetCheerLabel1 = "응원 보내기!"
        static let bottomSheetCheerLabel2 = "아이콘을 선택하면 추천 멘트가 뜨고, 수정도 가능해요."
        static let bottomSheetOpenLabel = "마니또 공개까지"
    }
    
    enum PlayManittoResult {
        static let sendCompleteTitleLabel = "전송 완료!"
        static let todaySentCheerLabel = "오늘 보낸 응원"
        static let cheerCountStr = "회"
        static let okayButtonStr = "확인"
    }
    
    enum PlayManittoResultBoard {
        static let headerTopDescriptionLabel = "나를 응원해 준 마니또는"
        static let headerTopDescriptionLabelAfterNameStr = "!"
        static let boardHeaderTotalStr = "총 "
        static let boardCountStr = "번"
        static let boardAfterCountStr = "의 응원을 받았어요!"
        static let boardShowDetailStr = "자세히 보기"
        static let bottomSheetDeleteButtonStr = "목록에서 삭제하기"
        static let bottomSheetRankLabel = "최고의 마니또 순위"
    }
}
