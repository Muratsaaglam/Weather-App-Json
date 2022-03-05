//
//  CurrentWeather.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 3.03.2022.
//

import Foundation
import UIKit

struct CurrentWeather
{
    
    let temperature : Double
    let precipProbability : Double
    let sumary: String
    let humidity : Double
    let icon : String
    
    init(temperature : Double, precipProbability : Double, sumary: String, humidity : Double, icon : String )
    {
        self.temperature = temperature
        self.precipProbability = precipProbability
        self.sumary = sumary
        self.humidity = humidity
        self.icon = icon       
        
    }
}

extension CurrentWeather
{
    var iconImage : UIImage
    {
        switch icon
        {
            
        case "clear-day" : return #imageLiteral(resourceName: "clear-day")
        case "clear-night" : return #imageLiteral(resourceName: "clear-night")
        case "rain" : return #imageLiteral(resourceName: "rain")
        case "snow" : return #imageLiteral(resourceName: "snow")
        case "sleet" : return #imageLiteral(resourceName: "sleet")
        case "wind" : return #imageLiteral(resourceName: "wind")
        case "fog" :  return #imageLiteral(resourceName: "fog")
        case "cloudy" : return #imageLiteral(resourceName: "cloudy")
        case "partly-cloudy-day" : return #imageLiteral(resourceName: "partly-cloudy-day")
        case "partly-cloudy-night" : return #imageLiteral(resourceName: "partly-cloudy-night")
        default : return #imageLiteral(resourceName: "default")
            
        }
        
        
    }
    
}

extension CurrentWeather
{
    struct Key
    {
        static let temperature  = "temperature"
        static let icon = "icon"
        static let summary = "summary"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
    }
    

    
    init?(json : [String: AnyObject])
    {

        guard let temp = json[Key.temperature] as? Double,
              let iconStr = json[Key.icon] as? String,
              let sum = json[Key.summary] as? String,
              let hum = json[Key.humidity] as? Double,
        let precipProb = json[Key.precipProbability] as? Double else
        {
         return nil
        }
                
        self.humidity = hum
        self.temperature = (temp - 32) / 1.8
        self.icon = iconStr
        self.precipProbability = precipProb
        self.sumary = sum
    }
    
}

