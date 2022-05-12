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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavouritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButtonView((episode: testEpisode,
                              inFavourites: .constant(true),
                              favourites: .constant([]))
    }
}
