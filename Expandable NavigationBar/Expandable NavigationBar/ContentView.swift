//
//  ContentView.swift
//  Expandable NavigationBar
//
//  Created by Jesus Antonio Gil on 16/2/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
