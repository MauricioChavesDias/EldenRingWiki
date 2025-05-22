//
//  CardView.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

struct CardView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)

                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.black)
                        .frame(width: 80)
                        .lineLimit(1)
                }
            }
            .padding()
        }
        .background(Color("darkYellow"))
        .opacity(0.9)
        .cornerRadius(20)

    }
}

#Preview {
    CardView(title: "Bosses",
             imageName: "bossIcon")
}

