//
//  CurrentWeatherModel.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 3.03.2022.
//

import Foundation
import UIKit


struct CurrentWeatherModel
{

    let summary : String
    let icon : UIImage
    let temperature : String
    let humidity : String
    let precipitationProbability : String
    
    
    init(data : CurrentWeather)
    {

        self.summary = data.sumary
        self.icon = data.iconImage
        self.precipitationProbability = "%\(data.precipProbability * 100) "
        self.temperature = "\(Int(data.temperature)) ° "
        self.humidity = "%\(Int(data.humidity*100))"
        
        
    }
    
    
    
}
