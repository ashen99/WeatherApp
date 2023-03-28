//
//  NetworkStore.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import Foundation

class NetworkStore : ObservableObject {
    @Published var weatherData: WeatherDataModel? //instance of a weatherdatamodel

    private var baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"

    func fetchData(cityName: String) async {
        
        var urlString = "\(baseURL)&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" // "addingPercentEncoding" replaces the spaces in the url with %20 since it is the url structure
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let decodableData = try JSONDecoder().decode(WeatherDTO.self, from: data)

            DispatchQueue.main.async {
                self.weatherData = WeatherDataModel(name: decodableData.name, description: decodableData.weather[0].description, temp: decodableData.main.temp, pressure: decodableData.main.pressure, humidity: decodableData.main.humidity, feelsLike: decodableData.main.feelsLike, visibility: decodableData.visibility, windSpeed: decodableData.wind.speed, cloudPercentage: decodableData.clouds.all)
            }
            
        } catch {
            print("Error")
        }
    }
}
