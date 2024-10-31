//
//  PlayManittoView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct PlayManittoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: PlayManittoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            NameTagView(name: viewModel.receiverUserName)
                .padding(.horizontal, 16)
            Spacer()
            PlayManittoBottomView()
                .frame(height: 557)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .shadow(radius: 10)
        }
        .environmentObject(viewModel)
        .background(.gray4)
        .ymNavBar(center: {
            Text("이게 도대체 뭔데")
                .font(.pretendardFont(for: .heading5))
        }, left: {
            Button(action: {
                dismiss()
            }) {
                Image(.icnLeftnarrow)
            }
        })
        .ignoresSafeArea(.container, edges: .bottom)
    }
}
