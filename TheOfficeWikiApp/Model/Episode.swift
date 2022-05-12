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


struct Episode: Decodable {
    
    let _id: String
    let title: String
    let description: String
    let airDate: String
    
}

let testEpisode = Episode(_id: "5e94d646f733a1332868e1dc", title: "Pilot", description: "A documentary crew gives a firsthand introduction to the staff of the Scranton branch of the Dunder Mifflin Paper Company, managed by Michael Scott.", airDate: "2005-03-24T06:00:00.000Z")
