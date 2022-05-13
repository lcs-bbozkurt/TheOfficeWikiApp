//
//  FavouritesButtonView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-12.
//

import SwiftUI

struct FavouritesButtonView: View {
    
    // MARK: Stored properties
    
    // The episode being shown
    let episode: Episode
    
    // Is this song in the list of favourites?
    @Binding var inFavourites: Bool
    
    // The list of favourite songs
    @Binding var favourites: [Episode]
    
    // MARK: Computed properties
    
    var body: some View {
        // Favourites button (heart)
        Button(action: {
            
            addOrRemoveEpisodeFromFavourites()
            
        }) {
            
            HStack {
                Text(inFavourites ? "Remove from\nFavourites" : "Add to\nFavourites")
                    .multilineTextAlignment(.center)
                
                Image(systemName: inFavourites ? "suit.heart.fill" : "suit.heart")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("deepRed"))
            }
        }
        task {
            await FavouritesButtonView(episode: [episode], inFavourites: false, favourites: [favourites])
        }
    }
    
    
    func addOrRemoveEpisodeFromFavourites() {
        
        // Is this song in the favourites list?
        if inFavourites == false {
            
            // OK then, add it to the list
            favourites.append(episode)
            inFavourites = true
            
        } else {
            
            // This iterates over the entire "favourites" list, looking
            // for a match to the current episode...
            favourites.removeAll(where: { currentEpisodeInList in
                currentEpisodeInList._id == episode._id
            })
            inFavourites = false
        }
        
        
    }
}

struct FavouritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButtonView(episode: testEpisode,
                             inFavourites: .constant(true),
                             favourites: .constant([]))
    }
}
