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
//        .onAppear {
//            //Use this to change settings from the navigationTitle
//            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name:"Mantinia", size: 40)!, .foregroundColor: UIColor(.accentColor)]
//        }
        .background(Image("background"))
        
  
        
    }
    
}


#Preview {
    HomeView()
}
