//
//  ViewController.swift
//  Weather-App-Json
//
//  Created by Murat Sağlam on 3.03.2022.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblPrecipitation: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    
    
    var locationManeger = CLLocationManager()
    
    let client = DarkSkyApiClient()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        title = "Weather App"
        //How To Set Background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        
        self.locationManeger.delegate = self
        //Uygulama Açıldığında Konum Paylaşma İzni İsteme
        self.locationManeger.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManeger.delegate = self
            locationManeger.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManeger.startUpdatingLocation()
            
            
        }
        

    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locationValue : CLLocationCoordinate2D = manager.location!.coordinate
        let clientCoordinate = Coordinate(latitude: locationValue.latitude, longitude: locationValue.longitude)
        updateWeather(coordinate: clientCoordinate)
        
        
        
    }
    
    
    
    
    
    func updateWeather(coordinate : Coordinate)
    {
        client.getCurrentWeather (at: coordinate) { currentWeather, error in
            if let currentWeather  = currentWeather
            {
                let viewModel = CurrentWeatherModel(data: currentWeather)
                
                
                
                
                // Location Using
                DispatchQueue.main.sync {
                    self.showWeather(model: viewModel)
                }
                
                
            }
            
        }
        
        
    }
    
    
    //Processing weather data -1
    func showWeather(model : CurrentWeatherModel)
    {
        lblSummary.text = model.summary
        lblHumidity.text = model.humidity
        lblTemperature.text = model.temperature
        lblPrecipitation.text = model.precipitationProbability
        weatherIcon.image = model.icon
        indicator.stopAnimating()
        
    }
    
    
    @IBAction func konumyenile(_ sender: Any) {
      
            indicator.startAnimating()
            locationManager(locationManeger, didUpdateLocations: [])
        
    }
}


