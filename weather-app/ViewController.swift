//
//  ViewController.swift
//  weather-app
//
//  Created by Eric Klose on 3/1/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        Forecast(city: "02111,us")
        
        print("URL: \(URL)")
        
   //     Forecast.downloadWeatherForecast { () -> () in
            //called when download done
            //self.updateUI()
    
    
    }


    

}

