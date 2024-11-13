//
//  BottomSheetContentType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/1/24.
//

import SwiftUI

enum BottomSheetContentType: CaseIterable {
    case delete
    case confirm
    
    var fillColor: Color {
        switch self {
        case .delete:
            return .lightError
        case .confirm:
            return .sub2
        }
    }
    
    var fillImage: Image {
        switch self {
        case .delete:
            return Image(.trash)
        case .confirm:
            return Image(.check)
        }
    }
    
    var titleText: Text {
        switch self {
        case .delete:
            return Text(StringLiterals.AfterJoinRoom.removeMemberLabel)
                .font(.pretendardFont(for: .heading3))
                .foregroundStyle(.ymBlack)
        case .confirm:
            return Text(StringLiterals.AfterJoinRoom.confirmRoomLabel)
                .font(.pretendardFont(for: .heading3))
                .foregroundStyle(.ymBlack)
        }
    }
    
    var subText: Text {
        switch self {
        case .delete:
            return Text(StringLiterals.AfterJoinRoom.removeMemberSubLabel)
                .font(.pretendardFont(for: .heading6))
                .foregroundStyle(.gray1)
        case .confirm:
            return Text(StringLiterals.AfterJoinRoom.confirmRoomSubLabel)
                .font(.pretendardFont(for: .heading6))
                .foregroundStyle(.gray1)
        }
    }
    
    var leftBtnText: Text {
        switch self {
        case .delete:
            return Text(StringLiterals.AfterJoinRoom.deleteBottomSheetLeftBtnLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.gray1)
        case .confirm:
            return Text(StringLiterals.AfterJoinRoom.confirmBottomSheetLeftBtnLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.gray1)
        }
    }
    
    var rightBtnText: Text {
        switch self {
        case .delete:
            return Text(StringLiterals.AfterJoinRoom.deleteBottomSheetRightBtnLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.ymWhite)
        case .confirm:
            return Text(StringLiterals.AfterJoinRoom.confirmBottomSheetRightBtnLabel)
                .font(.pretendardFont(for: .heading4))
                .foregroundStyle(.ymWhite)
        }
    }
}

