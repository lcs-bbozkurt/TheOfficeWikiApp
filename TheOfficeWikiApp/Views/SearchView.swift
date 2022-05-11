//
//  SearchView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: Stored Properties
    
    // This is a derived value; source of truth is at the app level: "TheOfficeWikiApp
    @Binding var favourites: [Episode]
    
    // Keeps track of what the user searches for
    @State var searchText: String = ""
    
    // Keeps the list of episodes retrieved from the API.
    @State var foundEpisodes: [Episode] = [] // empty array to start
    
    // MARK: Computed Properties

    var body: some View {
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testEpisode]))
    }
}
