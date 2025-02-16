//
//  Home.swift
//  Expandable NavigationBar
//
//  Created by Jesus Antonio Gil on 16/2/25.
//

import SwiftUI


struct Home: View {
    @State private var searchText: String = ""
    @State private var activeTab: Tab = .all
    @Environment(\.colorScheme) private var scheme
    @Namespace private var animation
    
    
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
        GeometryReader { proxy in
            let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
            
            VStack(spacing: 10) {
                // Title
                Text(title)
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                // Search Bar
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
                
                //Custom Segemented Picker
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(Tab.allCases, id:\.rawValue) { tab in
                            Button {
                                withAnimation(.snappy) {
                                    activeTab = tab
                                }
                            } label: {
                                Text(tab.rawValue)
                                    .font(.callout)
                                    .foregroundStyle(activeTab == tab ? (scheme == .dark ? .black : .white) : Color.primary)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    .background {
                                        if activeTab == tab {
                                            Capsule()
                                                .fill(Color.primary)
                                                .matchedGeometryEffect(id: "ACTIVEBAR", in: animation)
                                        } else {
                                            Capsule()
                                                .fill(.background)
                                        }
                                    }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .frame(height: 50)
            }
            .padding(.top, 25)
            .safeAreaPadding(.horizontal, 15)
            .offset(y: minY < 0 ? -minY : 0)
        }
        .frame(height: 190)
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
