//
//  ViewController.swift
//  weather-app
//
//  Created by Eric Klose on 3/1/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bostonForecast: Forecast!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        bostonForecast = Forecast(city: "02111,us")
        
        
        bostonForecast.downloadWeatherForecast { () -> () in
            //called when download done
            //self.updateUI()
            print("test")
            
        }
        
        
    }
    
}