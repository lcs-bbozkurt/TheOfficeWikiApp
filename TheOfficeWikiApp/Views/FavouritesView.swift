//
//  FavouritesView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: Stored properties
    
    // Derived value; a reference to the list of favourite songs
    @Binding var favourites: [Episode]
    
    // MARK: Computed properties

    var body: some View {
        NavigationView {
            
            VStack {
                // Show message if no favourites noted
                if favourites.isEmpty {

                    Spacer()
                    
                    Text("No favourite episodes yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                } else {

                    // Show list of favourite songs
                    List(favourites, id: \.id) { currentEpisode in
                        
                        NavigationLink(destination: EpisodeDetailView(episode: currentEpisode, inFavourites: true, favourites: $favourites)) {
                            ListItemView(Episode: currentEpisode)
                        }
                        
                    }
                    
                }
  
            }
            .navigationTitle("Favourites")
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favourites: .constant([testEpisode]))
    }
}
