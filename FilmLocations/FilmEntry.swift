//
//  FilmEntry.swift
//  FilmLocations
//
//  Created by Bo on 4/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation

struct FilmEntry {
    var firstActor: String
    var locations: String
    var releaseYear: String
    var title: String
}

extension FilmEntry {
    init?(json: [String: Any]) {
        guard let locations = json["locations"] as? String,
            let a1 = json["actor_1"] as? String,
            let year = json["release_year"] as? String,
            let title = json["title"] as? String
            else{
                return nil
        }
        self.firstActor = a1
        self.releaseYear = year
        self.title = title
        self.locations = locations
    }
}
