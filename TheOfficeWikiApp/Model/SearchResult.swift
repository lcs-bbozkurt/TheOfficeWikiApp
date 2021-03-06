//
//  SearchResult.swift
//  TheOfficeWikiApp
//
//  Created by Berk Bozkurt on 2022-05-11.
//


// The source of API that I am using.
// https://www.officeapi.dev/

// The JSON endpoint that I am using.
// https://jsonformatter.curiousconcept.com/#


// This page is for the list only.

import Foundation

struct SearchResult: Decodable {
    
    let data: [Episode]
    
}
