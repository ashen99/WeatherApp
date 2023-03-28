//
//  ContentView.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Label("Home" , systemImage: "house")
            }
            
            SearchView().tabItem {
                Label("Search" , systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
