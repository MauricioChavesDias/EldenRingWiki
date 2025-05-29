//
//  HomeView.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 22/5/2025.
//

import SwiftUI

struct HomeView: View {
    private let columnsLayout = [GridItem(.flexible()),
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
                            NavigationLink(destination: destinationView(for: card.selectedCard)) {
                                CardView(card: card)
                                    .hoverEffect()
                            }
                        }
                    }
                    .padding([.top, .horizontal])
                }
                .navigationTitle("Elden Ring")
            }
        }
        .onAppear {
            if let customFont = UIFont(name: "Mantinia", size: 40) {
                UINavigationBar.appearance().largeTitleTextAttributes = [
                    .font: customFont,
                    .foregroundColor: UIColor(.white)
                ]
            }
        }
    }

    @ViewBuilder
    private func destinationView(for type: CardItemType) -> some View {
        let repositoryMap: [CardItemType: any AnyEntityRepository] = [
            .ammos: AmmosRepository(service: AmmosService(networkService: NetworkService()))
            // Add more mappings as you implement them
        ]

        if let _ = repositoryMap[type] {
            let useCase = GetEntitiesUseCase(repositoryMap: repositoryMap)
            let viewModel = DynamicListViewModel(type: type, useCase: useCase)
            DynamicListView(viewModel: viewModel)
        } else {
            Text("Feature not implemented")
        }
    }
}

#Preview {
    HomeView()
}
