//
//  forecast.swift
//  weather-app
//
//  Created by Eric Klose on 3/1/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    
    private var _city: String!
    private var _URL: String!
    private var _currentTemp: String!
    private var _tempHigh: String!
    private var _tempLow: String!
    private var _currentWeather: String!
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var tempHigh: String {
        if _tempHigh == nil {
            _tempHigh = ""
        }
        return _tempHigh
    }
    
    var tempLow: String {
        if _tempLow == nil {
            _tempLow = ""
        }
        return _tempLow
    }
    
    var currentWeather: String {
        if _currentWeather == nil {
            _currentWeather = ""
        }
        return _currentWeather
    }
    
    var city: String {
        if _city == nil {
            _city = "02111,us"
        }
        return _city
    }
    
    var URL: String {
        if _URL == nil {
            _URL = ""
        }
        return _URL
    }
    
    init(city: String) {
        self._city = city
        
        _URL = "\(URL_BASE)\(URL_QUERY_TYPE)\(URL_LOCATION)"
        
    }
    
    func downloadWeatherForecast(completed: DownloadComplete) {
        
        let url = NSURL(string: _URL)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = "\(temp)"
                        print("temp: \(self._currentTemp)")
                    }
                    
                    if let temp_min = main["temp_min"] as? Double {
                        self._tempLow = "\(temp_min)"
                        print("min temp: \(self._tempLow)")
                    }
                    
                    if let temp_max = main["temp_max"] as? Double {
                        self._tempHigh = "\(temp_max)"
                        print("max temp: \(self._tempHigh)")
                    }
                }
                
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let description = weather[0]["description"] {
                        self._currentWeather = "\(description.capitalizedString)"
                        print("weather: \(self._currentWeather)")
                    }
                    if  weather.count > 1 {
                        for var x = 1; x < weather.count; x++ {
                            if let description = weather[x]["description"] {
                                self._currentWeather! += "[\(x)]: \(description.capitalizedString)"
                                print("weather: \(self._currentWeather)")
                            }
                        }
                    }
                }
            }
            completed()
            
            
            
        }
    }
}
