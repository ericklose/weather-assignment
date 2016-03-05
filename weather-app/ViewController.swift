//
//  ViewController.swift
//  weather-app
//
//  Created by Eric Klose on 3/1/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    var bostonForecast: Forecast!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        bostonForecast = Forecast(city: "02111,us")
        //updateUI()
        
        bostonForecast.downloadWeatherForecast { () -> () in
            //called when download done
            self.updateUI()
            print("download complete")
        }
        
        
    }
    
    
    func updateUI() {
        currentTempLbl.text = bostonForecast.currentTemp
        locationLbl.text = bostonForecast.city
        highTempLbl.text = bostonForecast.tempHigh
        lowTempLbl.text = bostonForecast.tempLow
        weatherDescription.text = bostonForecast.currentWeather
        let img = UIImage(named: "\(bostonForecast.weatherIcon)")
        weatherImg.image = img
    }
    
}