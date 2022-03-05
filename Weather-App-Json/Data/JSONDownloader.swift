//
//  JSONDownloader.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 4.03.2022.
//

import Foundation

class JSONDownloader
{
    
    let session : URLSession
    
    init (config : URLSessionConfiguration)
    {
        self.session = URLSession(configuration: config)
        
    }
    
    convenience init()
    {
        self.init(config: URLSessionConfiguration.default)
        
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONDownloaderCompletionHandler = (JSON?, DarkSkyError?) -> Void
    func jsonTask(with request : URLRequest, completionHandler completion : @escaping JSONDownloaderCompletionHandler) -> URLSessionDataTask
    {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else
            {
                completion(nil, DarkSkyError.RequestError)
                return
            }
            
            if httpResponse.statusCode == 200
            {
                //Data Check
                if let data = data
                {
                    do
                    {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
                        completion(json, nil)
                    }
                    catch
                    {
                        completion(nil, DarkSkyError.invalidData)
                        
                    }
                }
                else
                {
                    completion(nil, DarkSkyError.invalidData)
                    
                }
                
                
            }
            else
            {
                completion(nil, DarkSkyError.ResponseUnsuccesful(statusCode: httpResponse.statusCode))
                
            }
            
            
            
        }
        return task
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
