//
//  DynamicListView.swift
//  EldenRingWiki
//
//  Created by Mauricio Chaves Dias on 23/5/2025.
//

import SwiftUI

struct DynamicListView: View {
    @StateObject var viewModel: DynamicListViewModel

    var body: some View {
        List(viewModel.displayItems) { entity in
            VStack(alignment: .leading) {
                Text(entity.title)
            }
        }
        .navigationTitle(viewModel.type.rawValue) // ✅ Access the type name directly
    }
}
