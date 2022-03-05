//
//  DarkSkyError.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 4.03.2022.
//

import Foundation

enum DarkSkyError
{
    
    case RequestError
    case ResponseUnsuccesful(statusCode : Int )
    case invalidData
    case JSONParsingError
    case invalidURL
}
