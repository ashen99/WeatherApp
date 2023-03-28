//
//  SearchView.swift
//  WeatherApplication
//
//  Created by Ranul Akmeemana on 2023-03-11.
//

import SwiftUI

struct SearchView: View {
    @State var cityName: String = ""
    @State var networkStore = NetworkStore()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weather").font(.largeTitle).bold()
            
            HStack {
                TextField("City Name", text: $cityName).textFieldStyle(.roundedBorder).autocorrectionDisabled()
                
                Button {
                    //code
                    guard !cityName.isEmpty else { return }
                    
                    Task {
                        await networkStore.fetchData(cityName: cityName)
                    }
                } label: {
                    Text("Search")
                }
            }
            if let data = networkStore.weatherData {
                ScrollView {
                    HStack {
                        WeatherConditionView(image: "aqi.medium", title: "few clouds", subTitle: "Current Status")
                        WeatherConditionView(image: "thermometer.low", title: "clouds", subTitle: "Temperature")
                    }
                    HStack {
                        WeatherConditionView(image: "aqi.medium", title: "few clouds", subTitle: "Current Status")
                        WeatherConditionView(image: "thermometer.low", title: "clouds", subTitle: "Temperature")
                    }
                    HStack {
                        WeatherConditionView(image: "aqi.medium", title: "few clouds", subTitle: "Current Status")
                        WeatherConditionView(image: "thermometer.low", title: "clouds", subTitle: "Temperature")
                    }
                    HStack {
                        WeatherConditionView(image: "aqi.medium", title: "few clouds", subTitle: "Current Status")
                        
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct WeatherConditionView : View {
    var image: String
    var title: String
    var subTitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 0.45 , height: 195)
                .foregroundColor(.gray)
                .opacity(0.4)
            
            VStack(spacing: 20) {
                Image(systemName: image).font(.system(size: 50))
                Text(title).font(.system(size: 20)).bold()
                Text(subTitle)
            }
        }
    }
}
