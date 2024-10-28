//
//  YMCircleButton.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/28/24.
//

import SwiftUI

enum YMCircleButtonType {
    case copy
    case share
}

struct YMCircleButton: View {
    var circleBtnType: YMCircleButtonType
    
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(uiImage: image)
                .frame(width: 48, height: 48, alignment: .center)
                .foregroundColor(.gray1)
                .background(.gray3)
                .clipShape(Circle())
        }
    }
    
    var image: UIImage {
        switch circleBtnType {
        case .copy:
            return .icnCopy
        case .share:
            return .icnShare
        }
    }
}

#Preview {
    YMCircleButton(circleBtnType: .copy, action: {})
}
