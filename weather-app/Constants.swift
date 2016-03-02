//
//  Constants.swift
//  weather-app
//
//  Created by Eric Klose on 3/1/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import Foundation

let URL_BASE = "api.openweathermap.org/data/2.5/forecast?appid=3c257522fc193a6750f673e02e05bd16&units=metric"
let URL_QUERY_TYPE = "&zip="
let URL_LOCATION = "02111,us"

let URL = "\(URL_BASE)\(URL_QUERY_TYPE)\(URL_LOCATION)"

typealias DownloadComplete = () -> ()


