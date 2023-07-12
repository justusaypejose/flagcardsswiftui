//
//  FlagsSwiftUIApp.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import SwiftUI

@main
struct FlagsSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}


struct MainTabView: View {
    var body: some View {

        TabView {
            Group {
                CountryListView()
                    .tabItem {
                        Image(systemName: "house.and.flag.fill")
                        Text("Flags")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                CountryCardsSwipeView()
                    .tabItem {
                        Image(systemName: "flag.2.crossed.fill")
                        Text("Swipe")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
            }
        }
    }
}
