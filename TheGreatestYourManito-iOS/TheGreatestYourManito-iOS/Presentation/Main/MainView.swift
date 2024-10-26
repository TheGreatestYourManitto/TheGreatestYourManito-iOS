//
//  MainView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/27/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(.icnSmallLogo)
                Spacer()
                Image(.icnSetting)
            }
            .padding(.top, 24)
            Button(action: {}) {
                Image(.icnPlus)
                    .foregroundColor(.primary)
                    .padding()
                    .frame(height: 64)
                    .frame(maxWidth: .infinity)
                    .background(.sub2)
                    .clipShape(.rect(cornerRadius: 8))
            }
            .padding(.top, 32)
            
            List {
                RoomCardView(title: "Test", subtitle: "test", endDate: Date())
                    .listRowInsets(EdgeInsets())
                RoomCardView(title: "Test", subtitle: "test", endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 25))!)
                    .listRowInsets(EdgeInsets())
            }
            .scrollContentBackground(.hidden)
            .listRowSpacing(16)
            
        }
        .padding(.horizontal, 16)
        .background(.gray4)
        

    }
}

#Preview {
    MainView()
}
