//
//  WeatherDTO.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import Foundation

struct WeatherDTO: Decodable {
    let name : String
    let weather: [WeatherSummery]
    let main: MainWeatherData
    let wind: WindData
    let clouds: CloudsData
    let visibility: Int
}

struct WeatherSummery :  Decodable {
    let description : String
}

struct MainWeatherData : Decodable {
    let temp: Double
    let pressure: Int
    let humidity :  Int
    let feelsLike: Double
    
    enum CodingKeys : String, CodingKey {
        case temp
        case pressure
        case humidity
        case feelsLike = "feels_like"
    }
}

struct WindData: Decodable {
    let speed: Double
}

struct CloudsData : Decodable {
    let all: Int
}
