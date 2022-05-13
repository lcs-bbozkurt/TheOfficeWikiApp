//
//  EpisodeDetailView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    // MARK: Stored properties
    

    var episode: Episode
    
    @Binding var favourites: [Episode]
    
    // MARK: Computed properties
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                
                Text(episode._id)
                    .font(.body)
                    .opacity(0.0)
                
                Text(episode.title)
                    .font(.title)
                
                Text(episode.description)
                    .font(.subheadline)
                    .italic()
                
                Text(episode.airDate)
                    .font(.body)
                
                Button(action: {
                    favourites.append(episode)
                }) {
                    Text("Add to Favourites")
                }
                .padding(.vertical)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EpisodeDetailView(episode: testEpisode,
                              favourites: .constant([]))
        }
    }
}
