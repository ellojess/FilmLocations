//
//  MultiType.swift
//  FilmLocations
//
//  Created by Bo on 4/13/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation

enum MultiType:Codable{

    func encode(to encoder: Encoder) throws {

    }

    case int(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self)  {
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self){
            self = .string(stringValue)
            return
        }
        throw MultiType.missingValue
    }


    enum MultiType: Error {
        case missingValue
    }
}

extension MultiType {
    var value: String {
        switch self {
        case .int(let intvalue):
            return String(intvalue)
        case .string(let stringValue):
            return stringValue
        }
    }

}
