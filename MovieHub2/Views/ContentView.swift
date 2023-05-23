//
//  ContentView.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection: Tab = .movie
    
    enum Tab {
        case movie
        case theater
        case profile
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 217/255.0, green: 37/255.0, blue: 29/255.0, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .white
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().backgroundColor = .red.withAlphaComponent(0.15)
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }

    var body: some View {
        TabView(selection: $selection) {
            MovieList()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
                .tag(Tab.movie)
            MovieList()
                .tabItem {
                    Label("Theaters", systemImage: "popcorn")
                }
                .tag(Tab.theater)
            MovieList()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
        .accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
