//
//  Episodes.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//

// The source of API that I am using.
// https://www.officeapi.dev/

// The JSON endpoint that I am using.
// https://jsonformatter.curiousconcept.com/#


import Foundation


struct Episode: Decodable, Identifiable {
    
    let id: String
    let title: String
    let description: String
    let airDate: String
    
    init(id: String, title: String, description: String, airDate: String) {
        self.id = id
        self.title = title
        self.description = description
        self.airDate = airDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: ._id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.airDate = try container.decode(String.self, forKey: .airDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case _id, title, description, airDate
    }
}

let testEpisode = Episode(id: "5e94d646f733a1332868e1dc", title: "Pilot", description: "A documentary crew gives a firsthand introduction to the staff of the Scranton branch of the Dunder Mifflin Paper Company, managed by Michael Scott.", airDate: "2005-03-24T06:00:00.000Z")
