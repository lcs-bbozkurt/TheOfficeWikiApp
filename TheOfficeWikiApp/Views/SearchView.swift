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
        
        NavigationView {
            
            

            ZStack {
     
                VStack {

                    // Search text was given, results obtained
                    // Show the list of results
                    // to uniquely identify each episode
                    List(searchResults, id: \._id) { currentEpisode in
                        
                        NavigationLink(destination: EpisodeDetailView(episode: currentEpisode, favourites: $favourites)) {
                            ListItemView(episode: currentEpisode)
                        }
                    }
                    .searchable(text: $searchText)
                }
                .navigationTitle("Episode Browser")
            }
            .task {
                await fetchResults()
            }

        }
        
    }
    
    var searchResults: [Episode] {
        if searchText.isEmpty {
            return foundEpisodes
        } else {
            
            // $0 is a shortcut to mean "first argument" in a closure.
            return foundEpisodes.filter { $0.title.contains(searchText) }
        }
    }
    
    // MARK: Functions
    func fetchResults() async {
        
        // Set the address of the JSON endpoint
        
        let url = URL(string: "https://www.officeapi.dev/api/episodes/")!
        
        // Start a URL session to interact with the endpoint
        let urlSession = URLSession.shared
        
        // Fetch the results of this search
        do {
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(from: url)
            
            // DEBUG: See what raw JSON data was returned from the server
            print(String(data: data, encoding: .utf8)!)
            
            // Attempt to decode and return the object containing
            // the search result
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
            // This is assigned to the array that will display the episodes in the user interface
            foundEpisodes = decodedSearchResult.data
            
        } catch {
            
            // Report about what happened
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testEpisode]))
    }
}
