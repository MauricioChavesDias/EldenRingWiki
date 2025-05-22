//
//  HomeView.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//


import SwiftUI

struct HomeView: View {
    let columnsLayout = [GridItem(.flexible()),
                         GridItem(.flexible()),
                         GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columnsLayout, spacing: 10) {
                    ForEach(CardItem.allCases, id: \.self) { card in
                        NavigationLink {
                            Text(card.title)
                        } label: {
                            CardView(card: card)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            }
            .navigationTitle("Elden Ring")
        }
        .onAppear {
            if let customFont = UIFont(name: "Mantinia", size: 40) {
                UINavigationBar.appearance().largeTitleTextAttributes = [
                    .font: customFont,
                    .foregroundColor: UIColor(.accentColor)
                ]
            } else {
                print("⚠️ Font 'Mantinia' not found. Make sure it's added to the project and Info.plist.")
            }
        }
        .background(Image("background"))
        
  
        
    }
    
}


#Preview {
    HomeView()
}
