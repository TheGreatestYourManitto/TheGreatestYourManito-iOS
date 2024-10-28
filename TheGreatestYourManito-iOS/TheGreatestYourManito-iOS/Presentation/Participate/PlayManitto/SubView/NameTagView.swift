//
//  NameTagView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct NameTagView: View {
    let name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("나의 마니또")
                .font(.pretendardFont(for: .heading4))
            HStack(spacing: 0) {
                Text(name)
                    .font(.pretendardFont(for: .heading2))
                    .foregroundStyle(.ymPrimary)
                Text("에게")
                    .font(.pretendardFont(for: .heading2))
            }
        }
    }
}
