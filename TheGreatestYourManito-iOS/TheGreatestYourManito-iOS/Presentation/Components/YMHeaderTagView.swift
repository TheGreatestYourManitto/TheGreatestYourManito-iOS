//
//  YMHeaderTagView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct YMHeaderTagView: View {
    let topDesc: String
    let name: String
    let afterNameText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(topDesc)
                .font(.pretendardFont(for: .heading4))
            HStack(spacing: 0) {
                Text(name)
                    .font(.pretendardFont(for: .heading2))
                    .foregroundStyle(.ymPrimary)
                Text(afterNameText)
                    .font(.pretendardFont(for: .heading2))
            }
        }
    }
}
