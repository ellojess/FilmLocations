//
//  FilmEntryCodable.swift
//  FilmLocations
//
//  Created by Bo on 4/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation

struct FilmEntryCodable : Codable{
    var firstActor: String
    var locations: String
    var releaseYear: MultiType
    var title: String
    
    enum CodingKeys:String,CodingKey
    {
        case firstActor = "actor_1"
        case locations = "locations"
        case releaseYear = "releaseYear"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstActor = (try container.decodeIfPresent(String.self, forKey: .firstActor)) ?? "Unknown"
        locations = (try container.decodeIfPresent(String.self, forKey: .locations)) ?? "Unknown Location"
        releaseYear = (try container.decodeIfPresent(MultiType.self, forKey: .releaseYear)) ?? MultiType.string("Unknown year")
        title = (try container.decodeIfPresent(String.self, forKey: .title)) ?? "Unknown Title"
    }
    
}

