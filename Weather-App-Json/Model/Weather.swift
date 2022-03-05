//
//  Weather.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 4.03.2022.
//

import Foundation


struct Weather
{
    
    let currently : CurrentWeather
    
    
    
    
}


extension Weather
{
    
    init?(json : [String : AnyObject])
    {
        
        guard let currentWeatherJson = json["currently"] as? [String : AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else
        {
            return nil
        }
        self.currently = currentWeather
        
    }
    
}
