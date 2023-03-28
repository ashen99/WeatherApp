//
//  WeatherDataModel.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import Foundation

struct WeatherDataModel {
    let name: String
    let description: String
    let temp: Double
    let pressure: Int
    let humidity :  Int
    let feelsLike: Double
    let visibility: Int
    let windSpeed: Double
    let cloudPercentage: Int
    
    var formattedtemp: String {
        return String(format: "%.1f", temp)
    }
}
