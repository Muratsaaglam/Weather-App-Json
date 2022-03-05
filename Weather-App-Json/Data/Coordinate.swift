//
//  Coordinate.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 4.03.2022.
//

import Foundation

struct Coordinate {
    
    let latitude  : Double
    let longitude : Double
}

extension Coordinate : CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland : Coordinate {
        return Coordinate(latitude: 37.8267, longitude: -122.4233)
    }
    
    
}
