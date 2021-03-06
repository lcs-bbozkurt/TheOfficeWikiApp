//
//  FavouritesView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: Stored properties
    
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
                    List(favourites, id: \._id) { currentEpisode in
                        
                        NavigationLink(destination: EpisodeDetailView(inFavourites: true, episode: currentEpisode,favourites: $favourites)) {
                            ListItemView(episode: currentEpisode)
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
