//
//  TheOfficeWikiAppApp.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-10.
//

import SwiftUI

@main
struct TheOfficeWikiAppApp: App {
    
    // MARK: Stored Properties
    // The source of truth for the list of favourite songs.
    
    @State var favourites: [Episode] = []
    
    // MARK: Computed Properties
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                SearchView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search")
                    }
                
                FavouritesView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favourites")
                    }
                
            }
        }
    }
}
