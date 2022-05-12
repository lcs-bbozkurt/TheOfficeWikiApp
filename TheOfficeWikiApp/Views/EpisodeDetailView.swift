//
//  EpisodeDetailView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    // MARK: Stored properties
    
    // Song to show in this view
    var episode: Episode
    
    // Whether this song is in the Favourites list or not
    @State var inFavourites: Bool
    
    // A reference to the list of favourite songs
    // This is a derived value; source of truth is at the app level
    @Binding var favourites: [Episode]
    
    // MARK: Computed properties
    
    var body: some View {
        ZStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text(episode.title)
                        .font(.title)
                    
                    Text(episode.description)
                        .font(.subheadline)
                    
                }
                    Spacer()
                .frame(maxWidth: .infinity)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        EpisodeDetailView(episode: testEpisode,
                          inFavourites: false,
                          favourites: .constant([]))
        }
    }
}
