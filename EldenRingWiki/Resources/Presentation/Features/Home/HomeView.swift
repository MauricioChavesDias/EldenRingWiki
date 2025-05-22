//
//  HomeView.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var blur: CGFloat = 5.0
    @State private var viewID = UUID()

    let columnsLayout = [GridItem(.flexible()),
                         GridItem(.flexible()),
                         GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.95)

                ScrollView {
                    LazyVGrid(columns: columnsLayout, spacing: 10) {
                        ForEach(CardItem.allCases, id: \.self) { card in
                            NavigationLink {
                                Text(card.title)
                            } label: {
                                CardView(card: card)
                                    .hoverEffect()
                                    .blur(radius: blur)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                }
                .navigationTitle("Elden Ring")
            }
        }
        .onAppear {
            // Update font styling (only needs to run once)
            if let customFont = UIFont(name: "Mantinia", size: 40) {
                UINavigationBar.appearance().largeTitleTextAttributes = [
                    .font: customFont,
                    .foregroundColor: UIColor(.white)
                ]
            }
            
            //apply effect once landing on the screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeOut(duration: 0.5)) {
                    blur = 0
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
