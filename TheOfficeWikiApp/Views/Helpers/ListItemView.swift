//
//  ListItemView.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

import SwiftUI

struct ListItemView: View {
    
    // MARK: Stored properties
    var episode: Episode
    
    // MARK: Computed properties
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(episode.title)
            
            Text(episode.description)
                .font(.caption)
            
            Text(episode.airDate)
                .font(.caption)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(episode: testEpisode)
    }
}
