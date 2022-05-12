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
            ZStack {
                
                VStack {
                    
                    // Search text was given, results obtained
                    // Show the list of results
                    // Keypath of \.trackId tells the List view what property to use
                    // to uniquely identify each song
                    List(foundEpisodes, id: \.trackId) { currentEpisode in
                        
                        NavigationLink(destination: EpisodeDetailView(episode: currentEpisode, inFavourites: false, favourites: $favourites)) {
                            ListItemView(song: currentEpisode)
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { whatWasTyped in
                        
                        // When what is typed in the search field changes,
                        // get new results from the endpoint
                        Task {
                            await fetchResults()
                        }

                    }

                    
                }
                .navigationTitle("Episode Browser")
                
                VStack {
                    Spacer()
                    
                    Text("Enter an episode name")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
                
        }
    }
    // MARK: Functions
    func fetchResults() async {
        
        // Sanitize the search input
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
        // Set the address of the JSON endpoint
        
        let url = URL(string: "https://www.officeapi.dev/api/episodes/\(input)&entity=episode")!
        
        // Configure a URLRequest instance
        // Defines what type of request will be sent to the address noted above
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        // Start a URL session to interact with the endpoint
        let urlSession = URLSession.shared
        
        // Fetch the results of this search
        do {
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            
            // DEBUG: See what raw JSON data was returned from the server
            print(String(data: data, encoding: .utf8)!)
            
            // Attempt to decode and return the object containing
            // the search result
            // NOTE: We decode to SearchResult.self since the endpoint
            //       returns a single JSON object
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
            // Now, we access the list of songs that are part of the decoded result
            // This is assigned to the array that will display the songs in the user interface
            foundEpisodes = decodedSearchResult.results
            
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
