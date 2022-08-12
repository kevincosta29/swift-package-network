//
//  ContentView.swift
//  Example
//
//  Created by Kevin Costa on 12/8/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.status {
                case .loading:
                    ProgressView()
                case .success:
                    List {
                        ForEach(viewModel.arrayCharacters) { character in
                            Text(character.name ?? "-")
                        }
                    }
                case .error(let strMsg):
                    Text(strMsg)
                }
            }.navigationTitle("Rick & Morty")
        }
        .onAppear {
            viewModel.fetchDocuments()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
