//
//  DarkApiClient.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 4.03.2022.
//

import Foundation

class DarkSkyApiClient
{
    //JSON APİ KEY
    fileprivate let apiKeyDarkSky = "4cb418bb54aa70da51742e395c441723"
    
    
    lazy var baseURL : URL =
    {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKeyDarkSky)/")!
        
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherTpyeCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    typealias WeatherCompletionHandler = (Weather?, DarkSkyError?) -> Void
    private func getWeather(at coordinate : Coordinate, completionHandler completion :  @escaping WeatherCompletionHandler)
    {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseURL) else
        {
            completion(nil, DarkSkyError.invalidURL)
            return
        }
              
        let requestURL = URLRequest(url: url)
    
        let task = downloader.jsonTask(with: requestURL) { json, error in
        guard let json = json else
        {
            completion(nil, error)
            return
        }

            guard let weather = Weather(json: json ) else
            {
                completion(nil, DarkSkyError.JSONParsingError)
                return
            }
            
            completion(weather, nil)
            
        }
        task.resume()
        
        
    
}
    func getCurrentWeather (at coordinate : Coordinate, completionHandler completion : @escaping CurrentWeatherTpyeCompletionHandler)
    {
        getWeather(at: coordinate) { weather, error in
            
            completion(weather?.currently,error)
        }
    }


//JSON
//let requestURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)

//let weatherData = try! Data(contentsOf: requestURL!)
//print(weatherData)

//let jsonData = try! JSONSerialization.jsonObject(with: weatherData, options: [])
//print(jsonData)
}
