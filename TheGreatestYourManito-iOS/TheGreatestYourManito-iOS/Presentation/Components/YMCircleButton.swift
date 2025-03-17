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
    case cancel
}

struct YMCircleButton: View {
    var circleBtnType: YMCircleButtonType
    
    var action: () -> Void
    var body: some View {
        VStack {
            Button(
                action: { action() }
            ) {
                switch circleBtnType {
                case .copy, .share:
                    Image(uiImage: image)
                        .frame(width: 48, height: 48, alignment: .center)
                        .foregroundColor(.gray1)
                        .background(.gray3)
                        .clipShape(Circle())
                case .cancel:
                    Image(uiImage: image)
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.gray1)
                        .background(.gray3)
                        .clipShape(Circle())
                }
                
            }
        }
    }
    
    var image: UIImage {
        switch circleBtnType {
        case .copy:
            return .icnCopy
        case .share:
            return .icnShare
        case .cancel:
            return .icnCancel
        }
    }
}

#Preview {
    YMCircleButton(circleBtnType: .cancel, action: {})
}
