//
//  Home.swift
//  Expandable NavigationBar
//
//  Created by Jesus Antonio Gil on 16/2/25.
//

import SwiftUI


struct Home: View {
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                DummyMessagesView()
            }
            .safeAreaPadding(15)
            .safeAreaInset(edge: .top, spacing: 0) {
                ExpandableNaigationBar()
            }
        }
        .background(.gray.opacity(0.15))
    }
    
    
    @ViewBuilder
    private func ExpandableNaigationBar(_ title: String = "Messages") -> some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                
                TextField("Search Conversations", text: $searchText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .frame(height: 45)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.background)
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
    
    @ViewBuilder
    private func DummyMessagesView() -> some View {
        ForEach(0..<20, id: \.self) { _ in
            HStack(spacing: 12) {
                Circle()
                    .frame(width: 55, height: 55)
                
                VStack(alignment: .leading, spacing: 6) {
                    Rectangle()
                        .frame(width: 140, height: 8)
                    
                    Rectangle()
                        .frame(height: 8)
                    
                    Rectangle()
                        .frame(width: 80, height: 8)
                }
            }
            .foregroundStyle(.gray.opacity(0.25))
            .padding(.horizontal, 15)
        }
    }
}


#Preview {
    Home()
}
