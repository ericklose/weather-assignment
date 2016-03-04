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
    private var _weather: String!
    
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
    
    var weather: String {
        if _weather == nil {
            _weather = ""
        }
        return _weather
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
    
    typealias DownloadComplete = () -> ()
    
    func downloadWeatherForecast(completed: DownloadComplete) {
        
//        let url = NSURL(string: _URL)!

        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?id=4317656&APPID=3c257522fc193a6750f673e02e05bd16")!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            print(response.result)
            print(result.value.debugDescription)
            print("hi5")
            print(url)
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                print("hi")
                if let _currentTemp = dict["temp"] as? String {
                    self._currentTemp = _currentTemp
                    print("\(_currentTemp)")
                }
                
                if let _weather = dict["description"] as? String {
                    self._weather = _weather
                    print("\(_weather)")
                }
                

                
//                if let moves = dict["moves"] as? [Dictionary<String, AnyObject>] where moves.count > 0 {
//                    if let name = moves[0]["name"] {
//                        self._pokeMoves = name.capitalizedString
//                    }
//                    if moves.count > 1 {
//                        for var x = 1; x < moves.count; x++ {
//                            if let name = moves[x]["name"] {
//                                self._pokeMoves! += ", \(name.capitalizedString)"
//                            }
//                        }
//                    }
//                }
                
                
            }
        }
    }
    

}